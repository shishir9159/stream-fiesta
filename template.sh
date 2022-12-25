#!/bin/bash

# Requires 'mediainfo' in path

LARGEST_VIDEO_FILE=$(find . -type f -name "*.mp4" -o -name "*.mkv"  -o -name "*.webm" | sort -nr | head -1)

mediainfo --Output="${LARGEST_VIDEO_FILE}" --Output='General;%Duration%' "$infile"
