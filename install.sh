#!/bin/sh

cp ptheno.sh ~/.local/bin/ptheno
chmod +x ~/.local/bin/ptheno 

: '
# Doing tests to see if there are config files the installation would have to overwrite
if test -f "../waybar/style.css"; then 
    echo "Waybar config detected. Would you like to overwrite your current Waybar config? [y/n]"
    read response
    if [ "$response" != "y" ]; then
        echo "Aborting installation"
        exit
    fi
fi
'