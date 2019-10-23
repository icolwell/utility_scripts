#!/bin/bash
set -e

if [ -n "$1" ]; then
    WORK_DIR="$1"
else
    WORK_DIR="$PWD"
fi

cd "$WORK_DIR"
mkdir -p "converted"

find * -maxdepth 0 -type f -name '*.jpg' -print0 |
while IFS= read -r -d '' FILE; do
    cp "$FILE" "converted/$FILE"

    # Convert to Grayscale
    convert "converted/$FILE" -colorspace Gray "converted/$FILE"

    # TODO: check size of file first
    # Downscale the image
    convert "converted/$FILE" -resize 50% "converted/$FILE"

    echo "Converted $FILE"
done
