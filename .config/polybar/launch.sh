#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c ~/.config/polybar/config.ini main &
polybar -c ~/.config/polybar/config.ini mon1 &
polybar -c ~/.config/polybar/config.ini mon2 &
polybar -c ~/.config/polybar/config.ini dummy &

#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar main 2>&1 | tee -a /tmp/polybarmain.log & disown
#polybar mon1 2>&1 | tee -a /tmp/polybarmain.log & disown
#polybar mon2 2>&1 | tee -a /tmp/polybarmain.log & disown
#polybar dummy 2>&1 | tee -a /tmp/polybarmain.log & disown
