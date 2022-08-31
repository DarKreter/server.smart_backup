#!/bin/bash

dest_path=$1
full_file_path=$2

echo $full_file_path

# Get file directory and file name
DIR="$(dirname "${full_file_path}")" ; FILE="$(basename "${full_file_path}")"

# Make sure path exists
mkdir -p "$dest_path"/"$DIR"
# Create file with identic name but inside are only metadata
exiftool "$full_file_path" > "$dest_path"/"$full_file_path"