#!/bin/bash
set -e

# This script converts video files from HEVC to AVC encoding
# The input file extensions are mkv and the output are mpg

if [ -n "$2" ]; then
    # 2 args provided
    OUTPUT_DIR="$2"
    INPUT_DIR="$1"
elif [ -n "$1" ]; then
    # 1 arg provided
    OUTPUT_DIR="$1"
    INPUT_DIR="$1"
else
    # no args provided
    OUTPUT_DIR="$PWD"
    INPUT_DIR="$PWD"
fi

TEMP_DIR=$(mktemp -d)

cd "$INPUT_DIR"
for FILE in *.mkv ; do
    MPG_FILE="$OUTPUT_DIR/$FILE.mpg"
    if [ -f "$MPG_FILE" ]; then
        echo "$FILE is already converted"
    else
        echo "Converting $FILE ..."
        ffmpeg -i "$FILE" -bsf:v h264_mp4toannexb -loglevel fatal -stats -sn -map 0:0 -map 0:1 -vcodec libx264 "$TEMP_DIR/$FILE.ts"
        mv "$TEMP_DIR/$FILE.ts" "$MPG_FILE"
    fi
done
