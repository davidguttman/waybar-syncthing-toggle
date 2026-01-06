#!/bin/bash
set -e

WAYBAR_DIR="${WAYBAR_CONFIG_DIR:-$HOME/.config/waybar}"

grep -q "waybar-syncthing-toggle" "$WAYBAR_DIR/config.jsonc" || { echo "Not installed"; exit 1; }

# Remove files
rm -f "$WAYBAR_DIR/scripts/waybar-syncthing-toggle.sh"
rm -f "$WAYBAR_DIR/waybar-syncthing-toggle.jsonc"
rm -f "$WAYBAR_DIR/waybar-syncthing-toggle.css"

# Remove from config
sed -i '/waybar-syncthing-toggle/d' "$WAYBAR_DIR/config.jsonc"
sed -i '/"custom\/syncthing"/d' "$WAYBAR_DIR/config.jsonc"

# Clean trailing commas (e.g., ",\n  ]" -> "\n  ]")
sed -i ':a;N;$!ba;s/,\n\(\s*\]\)/\n\1/g' "$WAYBAR_DIR/config.jsonc"

sed -i '/@import "waybar-syncthing-toggle.css"/d' "$WAYBAR_DIR/style.css"

echo "Uninstalled. Restart waybar: pkill waybar && waybar &"
