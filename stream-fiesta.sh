#!/bin/bash

# script file location
source "$(dirname "$0")"/help.sh
# source "$(dirname "$0")/help.sh"

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

# Process the input options. Add options as needed.        #
############################################################

# set torrent directory

# set output directory

#-a  Audiobook Torrent
#-b  Digital Book Torrent
#-m  Music Torrent
#
#
#
#-v	Verbose mode.
#-r	To process something recursively.
#-q	Keep silent; don’t ask the user.
#-o	To send output to a file or so.
#-l	To list a text.
#-l  current directory
#-f	To specify a file.
#-d	Output directory.
#
#
#
#-u update config
#-i interactive mode


#while true; do
 #  case "$1" in
 #    -v | --verbose ) VERBOSE=true; shift ;;
 #    -d | --debug ) DEBUG=true; shift ;;
 #    -m | --memory ) MEMORY="$2"; shift 2 ;;
 #    --debugfile ) DEBUGFILE="$2"; shift 2 ;;
 #    --minheap )
 #      JAVA_MISC_OPT="$JAVA_MISC_OPT -XX:MinHeapFreeRatio=$2"; shift 2 ;;
 #    --maxheap )
 #      JAVA_MISC_OPT="$JAVA_MISC_OPT -XX:MaxHeapFreeRatio=$2"; shift 2 ;;
 #    -- ) shift; break ;;
 #    * ) break ;;
 #  esac
 #done

# Get the options
# ":h:n" got to understand more about it
while getopts ":hn" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      n) # Enter a name
         Name=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;

#       	--)
        #		shift # The double dash makes them parameters
        #		break
        #		;;
   esac
done

#verbose='false'
 #aflag=''
 #bflag=''
 #files=''
 #while getopts 'abf:v' flag; do
 #  case "${flag}" in
 #    a) aflag='true' ;;
 #    b) bflag='true' ;;
 #    f) files="${OPTARG}" ;;
 #    v) verbose='true' ;;
 #    *) error "Unexpected option ${flag}" ;;
 #  esac
 #done

if [ -z "$(which find)" ]; then
    echo "find not found, install find before running this script"
    exit 0
fi

# main "$@"