#!/bin/bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 300 seconds, undim if user becomes active` \
  --timer 240 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  `# Undim & lock after 10 more seconds` \
  --timer 60 \
    'betterlockscreen -l' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  --timer 300 \
    'systemctl suspend' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1'


