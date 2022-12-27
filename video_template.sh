#!/bin/bash

# Requires 'mediainfo' in path

# remove complete name
# COVER IMAGE

LARGEST_VIDEO_FILE=$(find "$1" -type f -name "*.mp4" -o -name "*.mkv"  -o -name "*.webm" | sort -nr | head -1)

# IMDB link Metadata

echo "[mediainfo]"
mediainfo --Inform=template.txt --Output=TXT "${LARGEST_VIDEO_FILE}"
echo "[/mediainfo]"