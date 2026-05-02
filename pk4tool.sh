#!/bin/bash

# Create the work directory if it doesn't exist
mkdir -p work

# Loop through all .pk4 files in the current directory
for file in *.pk4; do
    # Check if the glob matched any files to avoid errors if no pk4 files exist
    [ -e "$file" ] || continue

    # Extract the base filename (e.g., "something1" from "something1.pk4")
    base_name="${file%.pk4}"

    # Define the target directory name (e.g., "something1.pk3dir")
    target_dir="work/${base_name}.pk3dir"

    # Create the target directory
    mkdir -p "$target_dir"

    # Extract the pk4 (zip) file into the target directory
    # using 7z. The -o flag specifies output directory.
    # Quotes handle filenames with spaces correctly.
    7z x "$file" -o"$target_dir"

    # Optional: Print status
    echo "Extracted '$file' to '$target_dir'"
done

echo "All done."
