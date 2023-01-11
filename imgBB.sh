#!/bin/bash

############################################################
############################################################
#                       Image Upload                       #
############################################################
############################################################

# API version 1
# Imgbb's API v1 allows to upload pictures

# API key is a must to run this script
if [ "$API_KEY" == "" ]; then
    echo "No API Key found. You must configure your own key before uploading to imgBB"
    echo "Grab an API key from https://api.imgbb.com/"
    exit 0
fi

if [ -z "$(which sed)" ]; then
    echo "sed not found, install sed before running this script"
    exit 0
fi

if [ -z "$(which curl)" ]; then
    echo "curl not found, install curl before running this script"
    exit 0
fi

function upload(){
    # api with expiration: "https://api.imgbb.com/1/upload?expiration=600&key=YOUR_CLIENT_API_KEY"
    curl -s --location --request POST "https://api.imgbb.com/1/upload?key=$API_KEY" --form "image=$1"    # $1 represent argument that's passed as a value
}

# Start loop for uploading
# Number of arguments passed to script: $#
for ((i = 1; i <= $#; i++)); do

    if [[ "${!i}" =~ ^https?:// ]];then
        response=$(upload "${!i}")
    else
        response=$(upload "@${!i}")
    fi

    stat=$(sed -n 's|.*"id":"\([^"]*\)".*|\1|p' <<< "$response")

    if [ -z "$stat" ];then
        err_code=$(sed -n 's|.*"code":\([^"]*\),".*|\1|p' <<< "$response")
        err_msg=$(sed -n 's|.*"message":"\([^"]*\)".*|\1|p' <<< "$response")
        echo "Upload error: $err_code, $err_msg" >&2
    else
        url=$(sed -n 's|.*"url":"\([^"]*\)".*|\1|p' <<< "$response")
        url=${url//\\/}
        echo "$url"
        arguments+=("$url")
        clipboard+="$url"

        if [ $# -gt 0 ]; then
		    clipboard+=$'\n'
	      fi
    fi
done

./video_template.sh arguments