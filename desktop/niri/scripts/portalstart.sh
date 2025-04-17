#!/usr/bin/env bash

sleep 1
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal
killall xdg-desktop-portal-hyprland
killall mako
sleep 2
/usr/libexec/xdg-desktop-portal-gtk &
/usr/libexec/xdg-desktop-portal-wlr &
/usr/libexec/xdg-desktop-portal &
/usr/libexec/xdg-desktop-portal-hyprland &
mako &
