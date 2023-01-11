#!/bin/bash

############################################################
############################################################
#                         Help                             #
############################################################
############################################################

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
#    echo "Usage: $(basename "$0") [<filename|URL> [...]]"

    echo "Usage: stream-fiesta [<filename|URL> [...]]"
    echo
    echo "Supports uploading multiple images,"
    echo "Link gets copied to pbcopy (macOS), clip (Windows), xclip/xsel (Linux),"
    echo "Direct link to image and the delete link is displayed,"
    echo "Grabbing a API KEY from https://api.imgbb.com/ is a requirement, put it in api_key"
    exit 0
fi

Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-g|h|v|V]"
   echo "options:"
   echo "g     Print the GPL license notification."
   echo "h     Print this Help."
   echo "v     Verbose mode."
   echo "V     Print software version and exit."
   echo
}
