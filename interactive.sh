# Copy to clipboard
if [ -n "$(which pbpaste)" ];then
    echo -n "$clipboard" | pbcopy
elif [ -n "$(which clip)" ];then
    echo -n "$clipboard" | clip
elif [ -n "$(which xclip)" ];then
    echo -n "$clipboard" | xclip
elif [ -n "$(which xsel)" ];then
    echo -n "$clipboard" | xsel -i
fi
