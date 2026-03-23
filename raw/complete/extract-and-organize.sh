#!/bin/bash
# Extract and organize the full Google Drive zip

set -euo pipefail

DOWNLOAD_DIR="/home/ubuntu/courses/raw/complete"
RAW_DIR="/home/ubuntu/courses/raw"

echo "=========================================="
echo "Arkived Course Materials - Extraction"
echo "=========================================="

# Find the zip file
ZIP_FILE=$(find "$DOWNLOAD_DIR" -name "*.zip" -type f | head -1)

if [[ -z "$ZIP_FILE" ]]; then
    echo "ERROR: No zip file found in $DOWNLOAD_DIR"
    echo "Please rsync the Google Drive zip to this directory first"
    exit 1
fi

echo "Found: $ZIP_FILE"
echo "Size: $(du -h "$ZIP_FILE" | cut -f1)"
echo ""

# Extract
echo "Extracting..."
cd "$DOWNLOAD_DIR"
unzip -q "$ZIP_FILE" -d extracted/

echo "Extraction complete!"
echo ""

# Show what we got
echo "Contents:"
find "$DOWNLOAD_DIR/extracted" -maxdepth 2 -type d | head -20

echo ""
echo "PDF count by folder:"
for dir in "$DOWNLOAD_DIR/extracted"/*/; do
    if [[ -d "$dir" ]]; then
        count=$(find "$dir" -name "*.pdf" 2>/dev/null | wc -l)
        echo "  $(basename "$dir"): $count PDFs"
    fi
done

echo ""
echo "=========================================="
echo "Next steps:"
echo "1. Review the extracted structure above"
echo "2. Run organize.sh to move to final locations"
echo "=========================================="
