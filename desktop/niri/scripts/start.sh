#!/usr/bin/env bash

cd ~
export XDG_RUNTIME_DIR="/tmp/niri"
export $(dbus-launch)
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR
exec niri --session
