#!/bin/bash
# Generate a single course using the Arkived bundle
# Usage: ./generate-course.sh <course_code> <input_dir> <output_dir>

set -e

COURSE_CODE="$1"
INPUT_DIR="$2"
OUTPUT_DIR="$3"

if [ -z "$COURSE_CODE" ] || [ -z "$INPUT_DIR" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: $0 <course_code> <input_dir> <output_dir>"
    echo "Example: $0 MTH141 ./raw/MTH141 ./generated/MTH141"
    exit 1
fi

echo "================================"
echo "Generating Course: $COURSE_CODE"
echo "================================"
echo "Input: $INPUT_DIR"
echo "Output: $OUTPUT_DIR"
echo ""

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Run the course generation via Claude Code
# This uses the processing pipeline from the bundle

cd /home/ubuntu/arkived

claude -p --allowed-tools "Read,Edit,Bash" \
    /home/ubuntu/arkived/.agent/course-generation-bundle/PROCESSING.md << EOF
INPUT_DIR: $INPUT_DIR
COURSE_CODE: $COURSE_CODE
OUTPUT_DIR: $OUTPUT_DIR
AUTO_MODE: true
EOF

echo ""
echo "Generation complete for $COURSE_CODE"
echo "Output: $OUTPUT_DIR"
