#!/bin/bash

# Find all project directories (replace with your actual directory pattern)
project_directories=$(ls -d ~/MG-RAST_RAW_DATA/mgp*/)


# Loop through project directories
for project_dir in $project_directories; do
  # Extract the unique identifier (e.g., "mgp100537" to "100537")
  identifier=$(echo "$project_dir" | sed 's/.*mgp\([0-9]*\).*/\1/')

  # Find .fna files and rename them to the desired format
  find "$project_dir" -type f -name "*.*.fastq" | while IFS= read -r fna_file; do
    base_filename=$(basename "$fna_file")

    # Remove the ".screen.passed" from the filename and append the correct identifier
    new_filename=$(echo "$base_filename" | sed "s/\.screen\.passed\.fastq/.fastq/")
    new_filename="${new_filename%.fna}_$identifier.fna"

    # Rename the file
    mv "$fna_file" "$project_dir/$new_filename"

    echo "Renamed $base_filename to $new_filename in $project_dir"
  done
done



