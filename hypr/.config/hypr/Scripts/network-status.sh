#!/bin/bash

max_ssid_length=15

interface=$(nmcli -t -f DEVICE,TYPE,STATE device | grep ":connected" | cut -d: -f1 | head -n1)

if [ -z "$interface" ]; then
    echo "󰤭 Offline"
    exit 0
fi

type=$(nmcli -t -f DEVICE,TYPE device | grep "$interface" | cut -d: -f2 | head -n1)

if [[ "$type" == "wifi" ]]; then

    signal=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep "^\*" | cut -d: -f2)

    if (( signal >= 80 )); then
        icon="󰤨"
    elif (( signal >= 60 )); then
        icon="󰤥"
    elif (( signal >= 40 )); then
        icon="󰤢"
    elif (( signal >= 20 )); then
        icon="󰤟"
    else
        icon="󰤯"
    fi

    ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
	
	ssid_length=$(echo $ssid | wc -m)
	if ((ssid_length > max_ssid_length)); then
		ssid_name_start=$(echo $ssid | head -c$(($max_ssid_length - 3)))
		ssid_name_end=$(echo $ssid | tail -c3)
		echo "$icon ${ssid_name_start}…${ssid_name_end}"	
	else
		echo "$icon $ssid"
	fi

elif [[ "$type" == "ethernet" ]]; then

    echo "󰈀 Ethernet"

else

    echo "󰤮 Unknown"

fi
