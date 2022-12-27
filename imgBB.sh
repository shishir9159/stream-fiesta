# API version 1
# Imgbb's API v1 allows to upload pictures

api_key="" #CAN NOT BE EMPTY

if [ "$api_key" == "" ]; then
    echo "No API Key found. You must configure your own key before uploading to imgbb"
    echo "Grab an API key from https://api.imgbb.com/"
    exit 0
fi

if [ -z "$(which curl)" ]; then
    echo "curl not found, install curl before executing this script"
    exit 0
fi

function upload(){
    # api with expiration: "https://api.imgbb.com/1/upload?expiration=600&key=YOUR_CLIENT_API_KEY"
    curl -s --location --request POST "https://api.imgbb.com/1/upload?key=$api_key" --form "image=$1"
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
#        del_link=$(sed -n 's|.*"delete_url":"\([^"]*\)".*|\1|p' <<< "$response")
#        del_link=${del_link//\\/}
#        echo "Delete URL: $del_link" >&2
        clipboard+="$url"

        if [ $# -gt 0 ]; then
		    clipboard+=$'\n'

	    fi
    fi
done