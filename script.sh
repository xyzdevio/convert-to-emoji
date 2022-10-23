#!/bin/bash

filename=$1
echo $filename

# find potential emojis in text
# ignore error 123 for cases where no match is found
list=$(grep -o "\\:\\S*\\:" $filename 2>/dev/null || true)

# search for emoji corresponding img and warn but still continue if not found
# replace all valid emoji elements and use github upload of img file (aka use the github hosted url version)
for item in $list; do
    # offset beg and end of str to remove pre/post-pend `:` elements
    len=$((${#item}-1))
    str=${item:1:$(($len-1))}
    # working str
    echo $str
    # find in github api
    # if found
    if true
    then
        echo "converting - $item"
    else
        echo "WARNING - $item is not a viable github emoji to convert"
        continue
    fi
    # replace str in file as img link
    github_url="https://github.githubassets.com/images/icons/emoji/unicode/1f4af.png?v8"
    sed -i -e "/$item/![$item]($github_url)/g" $filename
done

