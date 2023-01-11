#!/bin/bash

############################################################
############################################################
#              Audiobook Metadata Templating               #
############################################################
############################################################

# Amazon Metadata

LARGEST_AUDIO_FILE=$(find "${TARGET_DIRECTORY}" -type f -name "*.m4b" -o -name "*.mp3" | sort -nr | head -1)

echo "[mediainfo]"
mediainfo --Inform=audiobook-template.txt --Output=TXT "${LARGEST_AUDIO_FILE}"
echo "[/mediainfo]"