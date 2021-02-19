#!/bin/sh
TOGGLE_FILE=./.screen_toggle
if [ ! -e $TOGGLE_FILE ]; then
    echo "2 times 4k + 1 times FHD"
    xrandr --output DP-4 --primary --mode 3840x2160 --rate 60 --rotate normal --scale 1x1 --output DP-2 --mode 3840x2160 --rotate normal --rate 60 --left-of DP-4 --output HDMI-0 --mode 1920x1080 --rate 60 --rotate normal --right-of DP-4
    touch $TOGGLE_FILE
else
    echo "Only 2 times 4k"
    xrandr --output DP-4 --primary --mode 3840x2160 --rate 60 --rotate normal --scale 1x1 --output DP-2 --mode 3840x2160 --rotate normal --rate 60 --left-of DP-4 --output HDMI-0 --off --verbose
    rm $TOGGLE_FILE
fi

