#!/bin/bash

# Combine the AVI files and upload them so any issues can be quickly resolved

VIDEO_FILE_LIST=($MEDIA_PATH/*.avi)
echo "${VIDEO_FILE_LIST[@]}"

vlc -I dummy \
   "${VIDEO_FILE_LIST[@]}" \
   --no-sout-all \
   --sout-keep \
   --sout \
   "#gather:std{access=file,mux=avi,dst=\"$MEDIA_PATH/video.avi\"}" \
   vlc://quit

aws s3 cp "$MEDIA_PATH/video.avi" "s3://i.octopus.com/guides/failed-${VIDEO_FILE_NAME%.*}.avi" --acl public-read

