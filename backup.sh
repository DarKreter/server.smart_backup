#!/bin/bash

source_path=/mnt/ANIME
# source_path=/home/kretes/k8d.server.smart_backup/test
dest_path=/home/kretes/k8d.server.smart_backup/backup/

# remove existing backup
rm -rf $dest_path/*

# extension to just copy
copy_extensions=( '*.srt' '*.ass' '*.jpg' '*.png' '*.jpeg' '*.txt' '*.md')
# copy with folder structure
for ext in "${copy_extensions[@]}"
do
    :
   find $source_path -type f -iname $ext -exec rsync -a --progress --relative {} $dest_path \;
done

# extension to smart copy metadata
copy_extensions=( '*.mkv' '*.mp4' '*.mka')
# copy with folder structure
for ext in "${copy_extensions[@]}"
do
    :
   find $source_path -type f -iname $ext -exec ./copyMetadata.sh $dest_path {}  \;
done
