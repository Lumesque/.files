#!/usr/bin/env bash

requires-update() {
    [ -n "$(doas emerge -up | /bin/grep -E "Total: [[:digit:]]*" | awk '$2==0{print $2}')" ] && return 1
    return 0
}

if requires-update ; then
    notify-send --expire-time=5000 System "System updates available"
else
    notify-send --expire-time=1000 System "Maintenance was performed, no need to upgrade system."
fi
