#!/bin/bash

# Define source and destination directories
SOURCE_DIR="/Users/tulasi/Public/Code/drvital"
DEST_DIR="/Users/tulasi/Public/Code/drvital-docker"

# Create necessary directories if they don't exist
mkdir -p "$DEST_DIR/public"
mkdir -p "$DEST_DIR/.github/workflows"

# Copy the files
cp "$SOURCE_DIR/public/index.html" "$DEST_DIR/public/"
cp "$SOURCE_DIR/.github/workflows/pages.yml" "$DEST_DIR/.github/workflows/"
cp "$SOURCE_DIR/README.md" "$DEST_DIR/"

echo "Files copied successfully to $DEST_DIR" 