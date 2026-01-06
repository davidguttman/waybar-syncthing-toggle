# waybar-syncthing-toggle

A Waybar module to start/stop Syncthing with a single click. Useful for saving battery on laptops.

## Features

- Toggle Syncthing service on/off from your status bar
- Visual indicator shows running (bright) vs stopped (dimmed)
- Desktop notifications on state change

## Requirements

- Waybar
- Syncthing (running as a user service: `syncthing.service`)
- `libnotify` (for notifications)

## Installation

```bash
./install.sh
pkill waybar && waybar &
```

## Uninstallation

```bash
./uninstall.sh
pkill waybar && waybar &
```

## Usage

- Click the icon to toggle Syncthing on/off
- 󰓦 (bright) = Syncthing running
- 󰓨 (dimmed) = Syncthing stopped

## What gets installed

- `~/.config/waybar/scripts/waybar-syncthing-toggle.sh` - toggle script
- `~/.config/waybar/waybar-syncthing-toggle.jsonc` - module config (included by waybar)
- `~/.config/waybar/waybar-syncthing-toggle.css` - styles (imported by waybar)

Config edits (automatically managed):
- Adds to existing `"include": [...]` array
- Inserts `"custom/syncthing"` after `"group/tray-expander"` in `modules-right`
- Adds `@import "waybar-syncthing-toggle.css";` to `style.css`

## Requirements for install

Your waybar config must have:
- An existing `"include": [` array
- `"group/tray-expander",` in `modules-right`

## Configuration

To customize the waybar config location:
```bash
WAYBAR_CONFIG_DIR=/path/to/waybar ./install.sh
```

## License

MIT
