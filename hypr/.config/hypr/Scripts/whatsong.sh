#! /bin/bash

song_info=$(playerctl --ignore-player=firefox metadata --format='{{artist}} - {{title}}')

echo "$song_info"
