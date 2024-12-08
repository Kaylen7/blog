#!/bin/bash

while getopts "hs:t:T:S:f:d:" flag; do
  case $flag in
    h) echo "Use [-s "coma,separated,serie"], [-t "comma,separated,tags"], [-T "title"], [-S "summary"], [-f filename], [-d directory]"
        exit;;
    s) serie=$OPTARG;;
    t) tags=$OPTARG;;
    T) title=$OPTARG;;
    S) sum=$OPTARG;;
    f) filename=$OPTARG;;
    d) directory=$OPTARG;;
  esac
done

title=${title:-""}
serie=${serie:-""}
sum=${sum:-""}

if [ ! -n "$filename" ]; then
    echo "Missing filename"
    exit;
fi

if [ -n "$directory" ]; then
    directory="./content/posts/${directory}"
else
    directory="./content/posts"
fi

if [ -n "$serie" ]; then
  IFS=',' read -r -a serie_array <<< "$serie"
  serie_formatted=$(printf "\"%s\", " "${serie_array[@]}")
  serie_formatted="${serie_formatted%, }"
else
  serie_formatted=""
fi

if [ -n "$tags" ]; then
  IFS=',' read -r -a tags_array <<< "$tags"
  tags_formatted=$(printf "\"%s\", " "${tags_array[@]}")
  tags_formatted="${tags_formatted%, }"
else
  tags_formatted=""
fi

current_date=$(date +"%Y-%m-%d")

frontmatter="---
title: \"$title\"
summary: \"$sum\"
date: $current_date
series: [${serie_formatted}]
weight: 1
aliases: [\"/${filename}\"]
tags: [${tags_formatted}]
author: [\"Sara DM\"]
cover:
  image: images/.jpg
  hiddenInList: true
ShowToc: false
ShareButtons: twitter, bluesky
---"

mkdir -p $directory && echo "$frontmatter" > $directory/$filename.md