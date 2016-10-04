#!/bin/sh

# erkennung der Monitore
xrandr --output DisplayPort-0 --auto --output HDMI-0 --auto

case "$1" in
    left)
      #laptop steht links vom externen monitor
      xrandr --output DisplayPort-0 --auto --left-of HDMI-0
      ;;
    right)
      #laptop steht rechts vom externen monitor
      xrandr --output DisplayPort-0 --auto --right-of HDMI-0
      ;;
    single)
      #laptop einziger bildschrim
      xrandr --output DisplayPort-0 --auto --output HDMI-0 --off
      ;;
    auto)
      # neu erkennen
      ;;
    *)
        echo "Usage: $0 {left|right|single|auto}"
        exit 2
esac

# hintergrundbild wird auf den monitoren angepasst.
nitrogen --restore

exit 0
