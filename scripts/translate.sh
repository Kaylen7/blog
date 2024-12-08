#!/bin/bash

while getopts "hf:l:" flag; do
  case $flag in
    h) echo "Use [-f filename], [-l language code]"
        exit;;
    f) filename=$OPTARG;;
    l) language=$OPTARG;;
  esac
done

if [ ! -n "$filename" ]; then
    echo "Required filename"
    exit;
fi

language=${language:-"es"}

found=$(find ./content -maxdepth 4 -type f -name "${filename}.md")

if [ -n "$found" ]; then
    new_name="${found%.md}.$language.md"
    cp $found $new_name
fi