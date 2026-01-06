#!/bin/bash

# Check if syncthing is running
is_running() {
    systemctl --user is-active syncthing.service >/dev/null 2>&1
}

# Output status for waybar
status() {
    if is_running; then
        echo '{"text": "󰓦", "tooltip": "Syncthing running (click to stop)", "class": "active"}'
    else
        echo '{"text": "󰓨", "tooltip": "Syncthing stopped (click to start)", "class": "stopped"}'
    fi
}

# Toggle start/stop
toggle() {
    if is_running; then
        systemctl --user stop syncthing.service
        notify-send "Syncthing" "Stopped" -i syncthing
    else
        systemctl --user start syncthing.service
        notify-send "Syncthing" "Started" -i syncthing
    fi
}

case "$1" in
    toggle)
        toggle
        ;;
    status|"")
        status
        ;;
    *)
        echo "Usage: $0 {toggle|status}"
        exit 1
        ;;
esac
