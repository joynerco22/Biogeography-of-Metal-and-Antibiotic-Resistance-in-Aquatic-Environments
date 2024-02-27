#!/bin/bash

# Find all project directories. Modify this depending on your own directory requirements. In this case, the downloaded files exist in directories all beginning with mgp* followed by a numeric key. 
project_directories=$(ls -d ~/MG-RAST_RAW_DATA/mgp*/)


# Loop through project directories, then cut the numeric project ID off and save it as a variable. We're gonna use this to append to any downloaded metagenomes, to keep track of which project they originated.
for project_dir in $project_directories; do
  # Extract the unique identifier (e.g., "mgp100537" to "100537")
  identifier=$(echo "$project_dir" | sed 's/.*mgp\([0-9]*\).*/\1/')

  # Find .fna files and rename them to the desired format. Note that you'll want to modify the -name flag to either .fna or .fastq depending on your file requirements!
  find "$project_dir" -type f -name "*.*.fna" | while IFS= read -r fna_file; do
    base_filename=$(basename "$fna_file")

    # Remove the ".screen.passed" from the filename and append the correct identifier
    new_filename=$(echo "$base_filename" | sed "s/\.screen\.passed\.fastq/.fastq/")
    new_filename="${new_filename%.fna}_$identifier.fna"

    # Rename the file
    mv "$fna_file" "$project_dir/$new_filename"

    echo "Renamed $base_filename to $new_filename in $project_dir"
  done
done



