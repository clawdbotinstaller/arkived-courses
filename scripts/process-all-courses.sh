#!/bin/bash
# Arkived Continuous Course Processor
# Processes ALL courses from the Google Drive queue using Claude Code subagents

set -euo pipefail

REPO_ROOT="/home/ubuntu/courses"
ARKIVED_ROOT="/home/ubuntu/arkived"
LOG_DIR="$REPO_ROOT/logs"
QUEUE_FILE="$REPO_ROOT/QUEUE.md"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p "$LOG_DIR"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_DIR/process-all-$DATE.log"
}

# Configuration
MAX_PARALLEL=2
STAGE_TIMEOUT=7200  # 2 hours per stage
TOTAL_COURSES=10

cd "$REPO_ROOT"

log "=========================================="
log "Arkived Continuous Course Processor"
log "=========================================="
log "Processing $TOTAL_COURSES courses from Google Drive"
log "Max parallel: $MAX_PARALLEL"
log "Repository: https://github.com/clawdbotinstaller/arkived-courses"
log "=========================================="

# Course list from Google Drive
COURSES=(
    "MTH141:Calculus 1:Concordia University"
    "MTH240:Calculus 2:Concordia University"
    "CSC108:Intro to Computer Programming:University of Toronto"
    "MAT186:Calculus 1 Engineering:University of Toronto"
    "MAT187:Calculus 2 Engineering:University of Toronto"
    "PHY180:Classical Mechanics:University of Toronto"
    "CHM135:Chemistry Physical Principles:University of Toronto"
    "ECO100:Intro to Economics:University of Toronto"
    "STA130:Statistical Reasoning:University of Toronto"
    "MAT223:Linear Algebra:University of Toronto"
)

process_course() {
    local course_code="$1"
    local course_name="$2"
    local university="$3"
    local output_dir="$REPO_ROOT/generated/$course_code"
    local course_log="$LOG_DIR/${course_code}_$DATE.log"
    
    log "[$course_code] Starting processing..."
    
    mkdir -p "$output_dir"
    
    # Run the 5-stage pipeline via Claude Code subagent
    local prompt=$(cat << PROMPT
You are an Arkived Course Generation Subagent. Generate a complete course for ${course_code}.

COURSE DETAILS:
- Code: ${course_code}
- Name: ${course_name}
- University: ${university}

YOUR TASK:
Execute the 5-stage course generation pipeline defined in:
${REPO_ROOT}/course-generation-bundle/PROCESSING.md

OUTPUT REQUIREMENTS:
1. Save manifest to: ${output_dir}/${course_code}-manifest.ts
2. Save techniques to: ${output_dir}/techniques/*.json (10-15 files)
3. Save patterns to: ${output_dir}/patterns/*.json (8-10 files)
4. Save topics to: ${output_dir}/topics/*.json (8-9 files)
5. Save SQL seed to: ${output_dir}/${course_code}-content.sql
6. Save validation report to: ${output_dir}/validation-report.md

VALIDATION CHECKPOINTS (MUST PASS):
[ ] Exactly 3 worked examples per technique (easy, medium, hard)
[ ] At least 2 practice questions per pattern
[ ] All LaTeX valid (inline: \\( \\, display: \\[ \\])
[ ] All cross-references resolve
[ ] Manifest follows mth240 archetype exactly
[ ] SQL is valid SQLite syntax

REFERENCE MATERIALS (READ FIRST):
1. ${ARKIVED_ROOT}/docs/forge/mth240-archetype-template.md
2. ${ARKIVED_ROOT}/frontend/src/types/archetypes.ts
3. ${ARKIVED_ROOT}/frontend/src/courses/mth240-manifest.ts
4. ${ARKIVED_ROOT}/worker/src/validation/contentSchemas.ts

After generating, run validation:
cd ${ARKIVED_ROOT} && npm run validate:techniques && npm run validate:patterns

Report back with:
- Techniques generated: COUNT
- Patterns generated: COUNT  
- Topics generated: COUNT
- Validation status: PASS/FAIL
- Any errors encountered
PROMPT
)
    
    log "[$course_code] Launching Claude subagent..."
    
    # Run Claude with timeout
    timeout $STAGE_TIMEOUT claude -p --allowed-tools "Read,Bash,Edit" "$prompt" > "$course_log" 2>&1
    
    local exit_code=$?
    
    if [[ $exit_code -eq 0 ]]; then
        log "[$course_code] ✓ Generation complete"
        
        # Count generated files
        local tech_count=$(find "$output_dir/techniques" -name "*.json" 2>/dev/null | wc -l)
        local pat_count=$(find "$output_dir/patterns" -name "*.json" 2>/dev/null | wc -l)
        
        log "[$course_code] Generated: $tech_count techniques, $pat_count patterns"
        
        # Update QUEUE.md
        sed -i "s/| ${course_code} |.*| 🔴 Pending |/| ${course_code} | ${course_name} | ${university} | ✅ Complete | - | $(date +%Y-%m-%d) |/" "$QUEUE_FILE" || true
        
        # Commit progress
        git add -A
        git commit -m "feat: Complete ${course_code} - ${tech_count} techniques, ${pat_count} patterns" || true
        git push origin master || log "[$course_code] Push failed"
        
        return 0
    else
        log "[$course_code] ✗ Generation failed (exit: $exit_code)"
        
        # Update QUEUE.md
        sed -i "s/| ${course_code} |.*| 🔴 Pending |/| ${course_code} | ${course_name} | ${university} | ❌ Failed | - | $(date +%Y-%m-%d) |/" "$QUEUE_FILE" || true
        
        # Commit failure log
        git add "$course_log"
        git commit -m "feat: ${course_code} generation failed - see logs" || true
        
        return 1
    fi
}

# Main processing loop
log "Starting processing of ${#COURSES[@]} courses"

completed=0
failed=0
running=0

for course_spec in "${COURSES[@]}"; do
    IFS=':' read -r code name uni <<< "$course_spec"
    
    # Check if already completed
    if [[ -f "$REPO_ROOT/generated/$code/${code}-manifest.ts" ]]; then
        log "[$code] Already generated, skipping"
        ((completed++))
        continue
    fi
    
    # Process in background for parallelism
    process_course "$code" "$name" "$uni" &
    ((running++))
    
    # Limit parallelism
    if [[ $running -ge $MAX_PARALLEL ]]; then
        log "Waiting for batch to complete..."
        wait
        running=0
    fi
done

# Wait for remaining
wait

log "=========================================="
log "Processing Complete"
log "=========================================="
log "Completed: $completed"
log "Failed: $failed"
log "Total: ${#COURSES[@]}"
log "=========================================="
log "Repository: https://github.com/clawdbotinstaller/arkived-courses"
log "Generated content in: $REPO_ROOT/generated/"
