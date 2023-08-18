#!/bin/sh

connection_status() {
    connection=$(sudo wg show wg0 2>/dev/null | head -n 1 | awk '{print $NF }')
    if [ "$connection" = "wg0" ]; then
        echo "1"
    else
        echo "2"
    fi
}

config="$HOME/wg/wireguard.conf"
config_name="wg0"

case "$1" in
--toggle)
    if [ "$(connection_status)" = "1" ]; then
        sudo wg-quick down wg0 2>/dev/null
    else
        sudo wg-quick up wg0 2>/dev/null
    fi
    ;;
*)
    if [ "$(connection_status)" = "1" ]; then
        echo "$config_name up"
    elif [ "$(connection_status)" = "3" ]; then
        echo "#3 Config not found!"
    else
        echo "$config_name down"
    fi
    ;;
esac
