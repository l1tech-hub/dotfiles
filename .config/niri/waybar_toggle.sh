#!/bin/bash

# Check if Waybar is running
if pgrep -x "waybar" > /dev/null
then
  # Kill Waybar if it's running
  killall waybar
else
  # Launch Waybar if it's not running
  waybar &
fi
