#!/usr/bin/env bash

# Function to display usage information
usage() {
	echo "Usage: screenshot [--f | --a | --w | --cf | --ca | --cw | --help | -h]"
	echo "    --f     Fullscreen screenshot saved to file"
	echo "    --a     Area screenshot saved to file"
	echo "    --w     Window screenshot saved to file"
	echo "    --cf    Fullscreen screenshot to clipboard"
	echo "    --ca    Area screenshot to clipboard"
	echo "    --cw    Window screenshot to clipboard"
	echo "    --help, -h    Display this help message"
	exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
	usage
fi

# Directory and filename for the screenshot
DIR="$HOME/Pictures/Screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

# Create directory if it does not exist
mkdir -p "$dir"

# Function to take a screenshot and notify
take_screenshot() {
	local mode=$1
	local save_to_file=$2
	local capture_command

	case $mode in
	fullscreen)
		capture_command="maim"
		;;
	area)
		capture_command="maim -o --select"
		;;
	window)
		capture_command="maim --window $(xdotool getactivewindow)"
		;;
	*)
		usage
		;;
	esac

	if [ "$save_to_file" = true ]; then
		$capture_command "$DIR$NAME"
		xclip -selection clipboard -t image/png -i "$DIR$NAME"
		notify-send "Screenshot created and copied to clipboard" "Mode: $mode (saved to file)"
	else
		$capture_command | xclip -selection clipboard -t image/png
		notify-send "Screenshot copied to clipboard" "Mode: $mode"
	fi
}

# Parse arguments
OPTION=$1

case $OPTION in
--f)
	take_screenshot fullscreen true
	;;
--a)
	take_screenshot area true
	;;
--w)
	take_screenshot window true
	;;
--cf)
	take_screenshot fullscreen false
	;;
--ca)
	take_screenshot area false
	;;
--cw)
	take_screenshot window false
	;;
--help | -h)
	usage
	;;
*)
	usage
	;;
esac
