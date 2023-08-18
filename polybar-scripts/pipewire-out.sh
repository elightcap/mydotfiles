#!/bin/sh

getSinkVolume() {
    sinkvol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep '%' | awk '{print $5}')
    echo "${sinkvol}"
}

getSinkMute() {
    sinkMute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    echo "${sinkMute}"
}
no="no"
MUTE=$(getSinkMute)
SINK=$(getSinkVolume)

if [ $MUTE = "no" ]; then
    icon="" 
else
    icon=""
fi


case $1 in
    "--up")
        pamixer --increase 1
        ;;
    "--down")
        pamixer --decrease 1
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
        echo "${icon}: ${SINK}"
esac
