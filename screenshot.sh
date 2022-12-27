#!/bin/bash
# Requires 'ffmpeg' in path

if [ -z "$(which ffmpeg)" ]; then
    echo "ffmpeg not found, install ffmpeg before executing this script"
    exit 0
fi

# permission for the output folder

# Create output folder
OUT_FOLDER="$1"

if [[ "$1" != "" ]]; then
    OUT_FOLDER="./"
elif [[ -d "${OUT_FOLDER}" ]]; then
    echo "Error! invalid output folder"
    exit 125
fi

NUMBER_OF_SCREENSHOTS=3

# largest and probably longest video file
LARGEST_VIDEO_FILE=$(find . -type f -name "*.mp4" -o -name "*.mkv"  -o -name "*.webm" | sort -nr | head -1)
VIDEO_LENGTH_IN_SECONDS=$(ffprobe -i "${LARGEST_VIDEO_FILE}" -show_entries format=duration -v quiet -of csv="p=0")

#for i in $( eval echo {1..$NUMBER_OF_SCREENSHOTS} )
for i in $(seq 0 $NUMBER_OF_SCREENSHOTS)
do
    RANDOM_FRAME_TIME=$(date --date "00:00:00 $(shuf -n1 -i0-"${VIDEO_LENGTH_IN_SECONDS%.*}") sec" '+%T')
    #-t 1 -r 1  -vframes 1
    ffmpeg -loglevel quiet -ss "${RANDOM_FRAME_TIME}" -i "${LARGEST_VIDEO_FILE}" -pix_fmt rgb24 -flags +ilme -frames:v 1 -c:v png -y "${OUT_FOLDER}${i}.png"
done