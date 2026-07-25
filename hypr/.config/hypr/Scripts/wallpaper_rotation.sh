#!/usr/bin/env bash

DIR="$HOME/Pictures/Wallpapers"

while true; do
    find "$DIR" -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' \) |
    shuf |
    while IFS= read -r img; do
        awww img "$img" \
            --transition-type random \
            --transition-duration 1.5

        sleep 600
    done
done
