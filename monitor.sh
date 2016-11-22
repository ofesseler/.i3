#!/bin/sh

HDMI="HDMI1"
VGA="VGA1"

LAPTOP="LVDS1"
EXTERNAL=$HDMI

# erkennung der Monitore
function detect {
	xrandr --output $LAPTOP --auto --output $EXTERNAL --auto
}

detect

case "$1" in
    left)
      #laptop steht links vom externen monitor
      xrandr --output $LAPTOP --auto --left-of $EXTERNAL
      ;;
    right)
      #laptop steht rechts vom externen monitor
      xrandr --output $LAPTOP --auto --right-of $EXTERNAL
      ;;
    single)
      #laptop einziger bildschrim
      xrandr --output $LAPTOP --auto
      ;;
    auto)
      # neu erkennen
      detect
      ;;
    *)
        echo "Usage: $0 {left|right|single|auto}"
        exit 2
esac

# hintergrundbild wird auf den monitoren angepasst.
nitrogen --restore

exit 0
