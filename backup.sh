#!/bin/bash

# Lower priority of script
renice -n 10 $$

source_path=/mnt/ANIME
dest_path=/mnt/BACKUP/AnimeBackup/
# script dir
cwd=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# source_path=/home/kretes/k8d.server.smart_backup/test
# dest_path=/home/kretes/k8d.server.smart_backup/backup/

# remove existing backup
rm -rf $dest_path/*

# extension to just copy
copy_extensions=( '*.srt' '*.ass' '*.jpg' '*.png' '*.jpeg' '*.txt' '*.md')
# copy with folder structure
for ext in "${copy_extensions[@]}"
do
    :
   find $source_path -type f -iname $ext -exec rsync -av --relative {} $dest_path \;
done

# extension to smart copy metadata
fake_copy_extensions=( '*.mkv' '*.mp4' '*.mka')
# copy with folder structure
for ext in "${fake_copy_extensions[@]}"
do
    :
   find $source_path -type f -iname $ext -exec "$cwd"/copyMetadata.sh $dest_path {}  \;
done

mv "$dest_path"mnt/ANIME/* "$dest_path"
rm -d "$dest_path"mnt/ANIME
rm -d "$dest_path"mnt

echo "DONE!"
