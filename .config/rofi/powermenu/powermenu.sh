#!/usr/bin/env bash

theme="$HOME/.config/rofi/powermenu/style.rasi"


#!/usr/bin/env bash

## Author  : Evan Lightcap (elightcap)
## Github  : @elightcap
#
## Applets : powermenu

# Theme Elements

list_col='1'
list_row='4'

option_1=""
option_2=""
option_3=""
option_4=""


# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
        -dmenu \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
        shutdown now
	elif [[ "$1" == '--opt2' ]]; then
		reboot now
	elif [[ "$1" == '--opt3' ]]; then
		i3-msg exit
	elif [[ "$1" == '--opt4' ]]; then
		dm-tool lock
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
	$option_4)
		run_cmd --opt4
		;;
esac
