#!/usr/bin/env bash

HEADPHONES="Scarlett Solo (3rd Gen.) Headphones"
SPEAKERS="Pebble V3 Analog"

function change-device() {
    if [ -z "$1" ] ; then
        return 1
    fi
    wpctl status | \
    	awk '$0~/Sinks/{x=1} x==1{print;} $0~/Sources/{exit;}' |\
        grep "$1"          | \
        awk '{print $2}'   | \
	sed 's/\.$//' | \
	xargs wpctl set-default
}

while getopts ":hs" opt ; do
    case "$opt" in
        s)      change-device "$SPEAKERS"   ;;
        h)      change-device "$HEADPHONES"     ;;
        *)      echo "Unrecognized variable $opt";
                exit 1                        ;;
    esac
done
