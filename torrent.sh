#!/bin/bash

############################################################
############################################################
#                         Torrent                          #
############################################################
############################################################

TORRENT_FILE_NAME_SUFFIX=""

if [ -f "${TARGET_DIRECTORY}" ] || [ -d "${TARGET_DIRECTORY}" ]; then
  TARGET_DIRECTORY="$1"
else
  exit 100;
fi

if [[ "${TRACKER_URL}" == "" ]]; then
    echo "Error! no tracker url provided"
    exit 125
fi

# avoiding sed, as there would be unnecessary dependency on top of the others
# if [[ "${TORRENT_FILE_NAME}" == "" ]] then
#     TORRENT_FILE_NAME=$(echo "/home/user_name/torrent_directory" | sed "s/.*\///")
# fi

TORRENT_SIZE=$(du --apparent-size --block-size=1K -s "${TORRENT}" | awk '{ print $1}')

if [[ "${TORRENT_SIZE}" == 0 ]]; then
    echo "Error! torrent file is not valid"
    exit 150
fi

if [[ "${TORRENT_SIZE}" -ge 16000000 ]]; then
    PIECE_SIZE=24
elif [[ "${TORRENT_SIZE}" -ge 8000000 ]]; then
    PIECE_SIZE=23
elif [[ "${TORRENT_SIZE}" -ge 4000000 ]]; then
    PIECE_SIZE=22
elif [[ "${TORRENT_SIZE}" -ge 2000000 ]]; then
    PIECE_SIZE=21
elif [[ "${TORRENT_SIZE}" -ge 1000000 ]]; then
    PIECE_SIZE=20
elif [[ "${TORRENT_SIZE}" -ge 500000 ]]; then
    PIECE_SIZE=19
elif [[ "${TORRENT_SIZE}" -ge 350000 ]]; then
    PIECE_SIZE=18
elif [[ "${TORRENT_SIZE}" -ge 150000 ]]; then
    PIECE_SIZE=17
elif [[ "${TORRENT_SIZE}" -ge 50000 ]]; then
    PIECE_SIZE=16
else
    PIECE_SIZE=15
fi

# -p - Sets the private flag on the torrent. This should be set when it will be seeded on private trackers.

# mktorrent -v -l "${PIECE_SIZE}" -p -a "${TRACKER_URL}" "${TRACKER_URL}" -o "${TORRENT_FILE_NAME}"
mktorrent -l "${PIECE_SIZE}" -p -a "${TRACKER_URL}" "${TARGET_DIRECTORY}"
