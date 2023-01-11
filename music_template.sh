#!/bin/bash

############################################################
############################################################
#                Music Metadata Templating                 #
############################################################
############################################################

# Metadata

LARGEST_AUDIO_FILE=$(find "${TARGET_DIRECTORY}" -type f -name "*.wav" -o -name "*.mp3" | sort -nr | head -1)

echo "[mediainfo]"
mediainfo --Inform=music-template.txt --Output=TXT "${LARGEST_AUDIO_FILE}"
echo "[/mediainfo]"