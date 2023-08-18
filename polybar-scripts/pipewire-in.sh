#!/bin/sh

getSourceVolume() {
    sourcevol=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep '%' | awk '{print $5}')
    echo "${sourcevol}"
}

SOURCE=$(getSourceVolume)
icon=""
if [ $SOURCE = "0%" ]; then
    icon=""
else
    icon=""
fi
case $1 in 
    "--up")
        pactl set-source-volume @DEFAULT_SOURCE@ +10%
        ;;
    "--down")
        pactl set-source-volume @DEFAULT_SOURCE@ -10%
        ;;
    "--mute")
        if [ $SOURCE = "0%" ]; then
            pactl set-source-volume @DEFAULT_SOURCE@ 100%
        else
            pactl set-source-volume @DEFAULT_SOURCE@ 0%
        fi
        ;;
    *)
        echo "${icon}: ${SOURCE}"
esac
