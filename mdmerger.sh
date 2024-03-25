#!/bin/bash

# Check for minimum required number of arguments
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 'Main Title' <file1.md> <file2.md> ..."
    exit 1
fi

# Extract the main title and shift arguments
main_title="$1"
shift
output_file="files_combined.md"

# Start the combined file with the main title
echo "# $main_title" > "$output_file"
echo "" >> "$output_file"
echo "## Table of Contents" >> "$output_file"
echo "" >> "$output_file"

# Initialize counter for ToC entries
toc_counter=1

# Loop through all provided markdown files to build ToC
for file in "$@"; do
    title=$(basename "$file" .md | sed -e 's/^[0-9]*-//' -e 's/-/ /g')
    slug=$(echo "$title" | tr '[:upper:] ' '[:lower:]-' | sed 's/[^a-z0-9-]//g')

    # Add the entry to the ToC with proper numbering
    echo "$toc_counter. [$title](#$slug)" >> "$output_file"
    ((toc_counter++))
done

# Add an extra newline to separate ToC from content
echo "" >> "$output_file"

# Append actual content
for file in "$@"; do
    title=$(basename "$file" .md | sed -e 's/^[0-9]*-//' -e 's/-/ /g')
    slug=$(echo "$title" | tr '[:upper:] ' '[:lower:]-' | sed 's/[^a-z0-9-]//g')

    # Append the section header and content
    echo "<a name=\"$slug\"></a>" >> "$output_file"
    echo "# $title" >> "$output_file"
    cat "$file" >> "$output_file"
    echo "" >> "$output_file"
done

echo "Combined file with ToC created: $output_file"