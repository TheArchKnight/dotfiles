#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/$USER/.Xauthority

# Wait a moment to ensure monitor is fully detected
sleep 2

# Check and set refresh rate
if xrandr | grep -q "HDMI-1-0 connected"; then
    xrandr --output HDMI-1-0 --mode 1920x1080 --rate 100
fi

