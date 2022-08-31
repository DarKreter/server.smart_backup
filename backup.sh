#!/bin/bash

source_path=/mnt/ANIME
# source_path=./test
dest_path=./backup/

# remove existing backup
rm -rf $dest_path/*

# extension to just copy
copy_extensions=( '*.srt' '*.ass' '*.jpg' '*.png' '*.jpeg' '*.txt' '*.md')
# copy with folder structure
for ext in "${copy_extensions[@]}"
do
    :
   find $source_path -type f -iname $ext -exec rsync -ahv --progress --relative {} $dest_path \;
done
