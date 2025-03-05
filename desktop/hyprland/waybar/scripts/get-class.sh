#!/usr/bin/env bash

HEADPHONES="Focusrite Scarlett Solo"
SPEAKERS="Pebble V3"

function echo-current() {
    wpctl inspect @DEFAULT_AUDIO_SINK@ | \
        /bin/grep "long_card_name"
}

function set-class() {
    if [[ "$(echo-current)" == *"$1"* ]] ; then
        class="active-audio"
    else
        class="inactive-audio"
    fi
}

while getopts ":hs" opt ; do
    case "$opt" in
        s)      set-class "$SPEAKERS"   ;;
        h)      set-class "$HEADPHONES"     ;;
        *)      echo "Unrecognized variable $opt";
                exit 1                        ;;
    esac
done

jq --arg cls "$class" --null-input --unbuffered --compact-output '{"class": $cls}'
