#!/bin/bash
# Organize extracted courses into proper structure

set -euo pipefail

EXTRACTED_DIR="/home/ubuntu/courses/raw/complete/extracted"
RAW_DIR="/home/ubuntu/courses/raw"

echo "=========================================="
echo "Organizing Course Materials"
echo "=========================================="

# Map of folder names to course codes
declare -A COURSE_MAP=(
    ["_General_"]="GENERAL"
    ["Aerospace"]="AER222"
    ["Chemical"]="CHE200"
    ["Civil"]="CVL207"
    ["Computer - Electrical - Biomedical"]="ECE"
    ["Mechanical - Mechatronics - Industrial"]="MEC222"
)

for folder in "$EXTRACTED_DIR"/*/; do
    folder_name=$(basename "$folder")
    course_code="${COURSE_MAP[$folder_name]:-$folder_name}"
    
    echo ""
    echo "Processing: $folder_name -> $course_code"
    
    # Count PDFs
    pdf_count=$(find "$folder" -name "*.pdf" 2>/dev/null | wc -l)
    echo "  PDFs found: $pdf_count"
    
    if [[ $pdf_count -gt 0 ]]; then
        # Create destination
        dest_dir="$RAW_DIR/$course_code"
        mkdir -p "$dest_dir"
        
        # Copy files preserving structure
        cp -r "$folder"* "$dest_dir/"
        
        echo "  Copied to: $dest_dir"
    else
        echo "  Skipping (no PDFs)"
    fi
done

echo ""
echo "=========================================="
echo "Organization complete!"
echo "=========================================="
echo ""
echo "Final structure:"
ls -la "$RAW_DIR/"

echo ""
echo "Update course-queue.json with these courses:"
for dir in "$RAW_DIR"/*/; do
    if [[ -d "$dir" ]]; then
        code=$(basename "$dir")
        count=$(find "$dir" -name "*.pdf" 2>/dev/null | wc -l)
        if [[ $count -gt 0 ]]; then
            echo "  - $code: $count PDFs"
        fi
    fi
done
