#! /bin/bash
#!/bin/bash

BATTERY="/sys/class/power_supply/BAT0"

capacity=$(cat "$BATTERY/capacity")
status=$(cat "$BATTERY/status")

if [ "$status" = "Charging" ]; then
    icon="󰂄"
elif [ "$capacity" -ge 95 ]; then
    icon="󰁹"
elif [ "$capacity" -ge 85 ]; then
    icon="󰂁"
elif [ "$capacity" -ge 75 ]; then
    icon="󰂀"
elif [ "$capacity" -ge 65 ]; then
    icon="󰁿"
elif [ "$capacity" -ge 55 ]; then
    icon="󰁾"
elif [ "$capacity" -ge 45 ]; then
    icon="󰁽"
elif [ "$capacity" -ge 35 ]; then
    icon="󰁼"
elif [ "$capacity" -ge 25 ]; then
    icon="󰁻"
elif [ "$capacity" -ge 15 ]; then
    icon="󰁺"
else
    icon="󰂎"
fi

echo "$icon $capacity%"
