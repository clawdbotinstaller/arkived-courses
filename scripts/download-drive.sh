#!/bin/bash
# Download course materials from Google Drive
# Usage: ./download-drive.sh <drive_folder_id> <output_dir>

DRIVE_FOLDER_ID="${1:-1Px6S_JTshiD24jzTqCl_fFt8_65g9wiT}"
OUTPUT_DIR="${2:-./raw}"

# Note: Requires gdown or rclone to be installed
# For now, this is a placeholder - actual download requires authentication

echo "Downloading from Google Drive folder: $DRIVE_FOLDER_ID"
echo "Output directory: $OUTPUT_DIR"

# Create output directory if needed
mkdir -p "$OUTPUT_DIR"

# Check if rclone is available
if command -v rclone &> /dev/null; then
    echo "Using rclone..."
    rclone copy "gdrive:{$DRIVE_FOLDER_ID}" "$OUTPUT_DIR" --progress
elif command -v gdown &> /dev/null; then
    echo "Using gdown (for individual files)..."
    # gdown is for individual files, not folders
    echo "Please manually download the folder contents to: $OUTPUT_DIR"
else
    echo "WARNING: No Google Drive download tool found."
    echo "Please install rclone: https://rclone.org/"
    echo "Or manually download the folder to: $OUTPUT_DIR"
    exit 1
fi

echo "Download complete!"
echo ""
echo "Directory structure:"
find "$OUTPUT_DIR" -type f | head -20
