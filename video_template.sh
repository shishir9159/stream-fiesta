#!/bin/bash

# Requires 'mediainfo' in path

if [ -z "$(which mediainfo)" ]; then
    echo "mediainfo not found, install mediainfo before running this script"
    exit 0
fi

if [ "${TORRENT}" == "" ]; then
    echo "No API Key found. You must configure your own key before uploading to imgbb"
    echo "Grab an API key from https://api.imgbb.com/"
    exit 0
fi

LARGEST_VIDEO_FILE=$(find "${TORRENT}" -type f -name "*.mp4" -o -name "*.mkv"  -o -name "*.webm" | sort -nr | head -1)

# IMDB link Metadata

imgUrl=( "$@" )
for url in "${imgUrl[@]}"
do
        echo "[img]"
        echo "$url"
        echo "[/img]"
#  test.sh argument1 $i argument2
done

# shellcheck disable=SC2028
echo "\n\n\n"

echo "[mediainfo]"
mediainfo --Inform=template.txt --Output=TXT "${LARGEST_VIDEO_FILE}"
echo "[/mediainfo]"

# COVER IMAGE