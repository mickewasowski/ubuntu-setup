#!/usr/bin/env bash
set -euo pipefail

ALACRITTY_DIR="${HOME}/.config/alacritty"
THEME_DIR="${ALACRITTY_DIR}/themes"

CURRENT_LINK="${THEME_DIR}/current.toml"
LIGHT_THEME="${THEME_DIR}/light.toml"
DARK_THEME="${THEME_DIR}/dark.toml"

apply_theme_from_gnome() {
  local scheme

  scheme="$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")"

  echo "GNOME color scheme: $scheme"

  if [[ "$scheme" == "prefer-dark" ]]; then
    ln -sfn "$DARK_THEME" "$CURRENT_LINK"
    echo "Alacritty theme: dark"
  else
    ln -sfn "$LIGHT_THEME" "$CURRENT_LINK"
    echo "Alacritty theme: light"
  fi

  ls -l "$CURRENT_LINK"
}

apply_theme_from_gnome

gsettings monitor org.gnome.desktop.interface color-scheme | while read -r line; do
  echo "Detected change: $line"
  apply_theme_from_gnome
done
