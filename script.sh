#!/bin/bash

filename=$1
echo $filename

# find potential emojis in text
# ignore error 123 for cases where no match is found
list=$(grep -o "\\:\\S*\\:" $filename 2>/dev/null || true)

# search for emoji corresponding img and warn but still continue if not found
# replace all valid emoji elements and use github upload of img file (aka use the github hosted url version)
github_json=$(curl https://api.github.com/emojis)
for item in $list; do
    # offset beg and end of str to remove pre/post-pend `:` elements
    len=$((${#item}-1))
    str=${item:1:$(($len-1))}
    # working str
    echo $str
    # find in github api
    github_url=$(echo "$github_json" | jq -c  ".[\"$str\"]")
    # TODO - need a way to grab from 59->just the length until a non letter char is instroduced
    # and have render proper unicode char for that
    echo "github_url: $github_url"

    # if unicode val is found (aka not null), then handle
    unicode=""
    if [ $github_url = null ]
    then
        echo "WARNING - $item is not a viable github emoji to convert"
        continue
    else
        echo "github_url is \'$github_url\'"
    fi


    # TODO - instead of using github url for the full image, need to grab
    # the actual unicode character U+1f4af
    #github_url="https://github.githubassets.com/images/icons/emoji/unicode/1f4af.png?v8"
    url_copy=$(echo -e $github_url)
    unicode="\U${url_copy:60:5}"
    unicode=${unicode^^}
    echo $unicode
    echo "converting - $item"

    # replace str in file as img link
    sed -i -e "s,$item,$(echo -e $unicode) \<\!-- \![$str]($github_url) --\>,g" $filename
done

