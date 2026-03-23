#!/bin/bash
# Subagent harness for parallel course generation
# Continuously processes courses from raw/ to generated/

set -e

RAW_DIR="${1:-./raw}"
GENERATED_DIR="${2:-./generated}"
LOG_DIR="./logs"
MAX_PARALLEL="${3:-3}"

mkdir -p "$GENERATED_DIR" "$LOG_DIR"

echo "================================"
echo "Arkived Course Generation Harness"
echo "================================"
echo "Raw materials: $RAW_DIR"
echo "Output: $GENERATED_DIR"
echo "Max parallel: $MAX_PARALLEL"
echo ""

# Find all course directories
courses=()
for course_dir in "$RAW_DIR"/*/; do
    if [ -d "$course_dir" ]; then
        course_code=$(basename "$course_dir")
        courses+=("$course_code")
    fi
done

total_courses=${#courses[@]}
echo "Found $total_courses courses to process:"
printf '  - %s\n' "${courses[@]}"
echo ""

# Process each course
processed=0
for course_code in "${courses[@]}"; do
    processed=$((processed + 1))
    input_dir="$RAW_DIR/$course_code"
    output_dir="$GENERATED_DIR/$course_code"
    log_file="$LOG_DIR/$course_code-$(date +%Y%m%d-%H%M%S).log"
    
    echo "[$processed/$total_courses] Processing $course_code..."
    echo "  Input: $input_dir"
    echo "  Output: $output_dir"
    echo "  Log: $log_file"
    
    # Skip if already generated
    if [ -f "$output_dir/manifest.ts" ]; then
        echo "  SKIP: Already generated (manifest.ts exists)"
        echo ""
        continue
    fi
    
    # Run generation in background for parallel processing
    (
        echo "Starting $course_code at $(date)"
        ./scripts/generate-course.sh "$course_code" "$input_dir" "$output_dir" > "$log_file" 2>&1
        echo "Completed $course_code at $(date)"
        
        # Commit progress
        cd /home/ubuntu/courses
        git add -A
        git commit -m "feat: Add generated content for $course_code" || true
        git push origin master || true
    ) &
    
    # Limit parallel jobs
    if (( processed % MAX_PARALLEL == 0 )); then
        echo "Waiting for batch to complete..."
        wait
    fi
    
    echo ""
done

# Wait for remaining jobs
echo "Waiting for remaining jobs..."
wait

echo ""
echo "================================"
echo "All courses processed!"
echo "================================"
echo "Generated: $GENERATED_DIR"
echo "Logs: $LOG_DIR"
echo ""
echo "To push to GitHub:"
echo "  cd /home/ubuntu/courses && git push origin master"
