#!/bin/bash

filename=$1
echo $filename

# find potential emojis in text
# ignore error 123 for cases where no match is found
list=$(grep -o "\\:\\S*\\:" $filename 2>/dev/null || true)

# search for emoji corresponding img and warn but still continue if not found
# replace all valid emoji elements and use github upload of img file (aka use the github hosted url version)
for item in $list; do
    len=${#item}-1
    str=${item:1:$len}
    echo $item
    echo ${#item}
    echo ${#item}-1
    echo $len
    echo $str
done

