#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide a directory path as an argument."
  exit 1
fi

directory="$1"


# Make 4 folders
mkdir -p "$directory/text"
mkdir -p "$directory/JPG"
mkdir -p "$directory/PDF"
mkdir -p "$directory/misc"


for file in "$directory"/*; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    extension="${filename##*.}"
    lowercase_extension="${extension,,}"
    #echo $filename;
    #echo $extension;
    #echo $lowercase_extension;

    case "$lowercase_extension" in
      txt) mv "$file" "$directory/text" ;;
      jpg|jpeg) mv "$file" "$directory/JPG" ;;
      pdf) mv "$file" "$directory/PDF" ;;
      *) mv "$file" "$directory/misc" ;;
    esac
  fi
done
