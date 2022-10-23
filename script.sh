#!/bin/bash

echo "here1"
filename=$1
echo "here2"
echo $filename
echo "here3"

# find potential emojis in text
grep -o "\:\S*\:" $filename
echo "here4"

# search for emoji corresponding img and warn but still continue if not found

# replace all valid emoji elements and use github upload of img file (aka use the github hosted url version)
