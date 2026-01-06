#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WAYBAR_DIR="${WAYBAR_CONFIG_DIR:-$HOME/.config/waybar}"

[[ -f "$WAYBAR_DIR/config.jsonc" ]] || { echo "Error: config.jsonc not found"; exit 1; }

grep -q "waybar-syncthing-toggle" "$WAYBAR_DIR/config.jsonc" && { echo "Already installed"; exit 1; }

# Copy files
mkdir -p "$WAYBAR_DIR/scripts"
cp "$SCRIPT_DIR/src/waybar-syncthing-toggle.sh" "$WAYBAR_DIR/scripts/"
cp "$SCRIPT_DIR/src/waybar-syncthing-toggle.jsonc" "$WAYBAR_DIR/"
cp "$SCRIPT_DIR/src/waybar-syncthing-toggle.css" "$WAYBAR_DIR/"
chmod +x "$WAYBAR_DIR/scripts/waybar-syncthing-toggle.sh"

# Add to config (insert after known patterns)
sed -i 's/"include": \[/"include": [\n    "~\/.config\/waybar\/waybar-syncthing-toggle.jsonc",/' "$WAYBAR_DIR/config.jsonc"
sed -i 's/"group\/tray-expander",/"group\/tray-expander",\n    "custom\/syncthing",/' "$WAYBAR_DIR/config.jsonc"

# Add CSS import
sed -i '1i @import "waybar-syncthing-toggle.css";' "$WAYBAR_DIR/style.css"

echo "Installed. Restart waybar: pkill waybar"
