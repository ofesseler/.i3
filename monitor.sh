#!/bin/sh

# erkennung der Monitore
xrandr --output LVDS1 --auto --output HDMI1 --auto

case "$1" in
    left)
      #laptop steht links vom externen monitor
      xrandr --output LVDS1 --auto --left-of HDMI1
      ;;
    right)
      #laptop steht rechts vom externen monitor
      xrandr --output LVDS1 --auto --right-of HDMI1
      ;;
    single)
      #laptop einziger bildschrim
      xrandr --output LVDS1 --auto
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
