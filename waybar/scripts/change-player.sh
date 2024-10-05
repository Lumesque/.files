#!/usr/bin/env bash

HEADPHONES="Focusrite_Scarlett_Solo_USB"
SPEAKERS="ACTIONS_Pebble"

function change-device() {
    if [ -z "$1" ] ; then
        return 1
    fi
    pactl list short sinks | \
        grep "$1"          | \
        head -n 1          | \
        awk '{print $1}'   | \
        xargs pactl set-default-sink || \
        paplay /usr/share/sounds/freedesktop/stereo/bell.oga
}

while getopts ":hs" opt ; do
    case "$opt" in
        s)      change-device "$SPEAKERS"   ;;
        h)      change-device "$HEADPHONES"     ;;
        *)      echo "Unrecognized variable $opt";
                exit 1                        ;;
    esac
done
