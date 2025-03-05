#!/bin/bash

# Store the current directory
ORIGINAL_DIR=$(pwd)

# Source directory (assuming it's in the current project)
SOURCE_DIR="./htdocs"

# Destination directory with full path to home directory
DEST_DIR="/Users/joon/git/joon.be/htdocs/isleofgames"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' not found!"
    exit 1
fi

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Pull latest changes from the destination git repository
echo "Pulling latest changes from git repository..."
cd /Users/joon/git/joon.be
if ! git pull; then
    echo "Error: Failed to pull latest changes from git repository!"
    cd "$ORIGINAL_DIR"
    exit 1
fi

# Return to the original directory
cd "$ORIGINAL_DIR"

# Use rsync to copy files
# -a: archive mode (preserves permissions, timestamps, etc.)
# -v: verbose output
# -z: compress data during transfer
# --delete: remove files in destination that don't exist in source
echo "Deploying files from $SOURCE_DIR to $DEST_DIR..."
rsync -avz --delete "$SOURCE_DIR/" "$DEST_DIR"

echo "Deployment complete!"
