#!/bin/sh

DMENU="dmenu -p > -l 20 -i -fn Liberation-8.5 -nb #222222 -nf #dddddd -sb #0088CC -sf #dddddd"

if ! command -v "dmenu" >/dev/null 2>&1; then
      printf "%s\\n" "you need to install 'dmenu' to run this program" >&2
          exit 1
        fi

        TITLE="$(i3-msg -t get_tree | egrep -o "(class.:.[a-Z]+.|title.:.[()0123456789~. -/a-Z]+)" | \
          sed 's/"//g;s/class://g;s/title://g' | while read -r line; read -r line2; do printf "%s\\n" "$line :: $line2"; done | sed '/i3bar for/d' | ${DMENU})"

        if [ -z "${TITLE}" ]; then
              exit 1
            else
                  TITLE="$(printf "%s\\n" "${TITLE}" | egrep -o "::.*" | sed 's/:: //g;s/\([()]\)/\\\1/g')"
                      i3-msg "[title=\"${TITLE}\"] focus"
                    fi
        fi
fi
