#!/usr/bin/env bash

set -euo pipefail

# Paths
ALACRITTY_DIR="${HOME}/.config/alacritty"
THEME_DIR="${ALACRITTY_DIR}/themes"

CURRENT_LINK="${THEME_DIR}/current.toml"
LIGHT_THEME="${THEME_DIR}/light.toml"
DARK_THEME="${THEME_DIR}/dark.toml"

apply_theme_from_gnome() {
  local scheme

  scheme="$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")"

  if [[ "$scheme" == "prefer-dark" ]]; then
    ln -sfn "$DARK_THEME" "$CURRENT_LINK"
    echo "Applied dark theme"
  else
    # "default" or anything unexpected
    ln -sfn "$LIGHT_THEME" "$CURRENT_LINK"
    echo "Applied light theme"
  fi
}

# Apply once on startup
apply_theme_from_gnome

# Watch for GNOME theme changes
gsettings monitor org.gnome.desktop.interface color-scheme | while read -r _; do
  apply_theme_from_gnome
done
