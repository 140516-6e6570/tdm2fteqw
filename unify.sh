#!/bin/bash

# Define source and destination
SOURCE_DIR="work"
DEST_DIR="tdm.pk3dir"

# Create the destination directory
mkdir -p "$DEST_DIR"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' not found."
    exit 1
fi

# Find all directories ending in .pk3dir inside the work folder
# and copy their contents into the destination
for folder in "$SOURCE_DIR"/*.pk3dir; do
    # Check if the glob matched any directories
    [ -e "$folder" ] || continue

    echo "Merging contents from '$folder'..."

    # Copy all contents.
    # -a: Archive mode (preserves permissions, symlinks, timestamps)
    # -f: Force overwrite
    # --no-target-directory: Ensures we copy the *contents* of the source
    # into the dest, not the source folder itself.
    cp -af "$folder"/. "$DEST_DIR"/
done

echo "Done. All assets unified into '$DEST_DIR'"
