#!/bin/bash

# Configuration
THEME_NAME="MyTinyCursor"
ICONS_DIR="${HOME}/.local/share/icons/${THEME_NAME}"
CURSOR_DIR="$ICONS_DIR/cursors"

# Note: Cursor compiled with:
# xcursorgen dot.cursor left_ptr

echo "🚀 Installing $THEME_NAME..."

if [ ! -d "${ICONS_DIR}" ]; then
  cp -r "${THEME_NAME}" "${ICONS_DIR}"
else
  cp -r "${THEME_NAME}"/* "${ICONS_DIR}/"
fi

# Create symlinks for some cursor states
cd "${ICONS_DIR}/cursors"
TARGET="left_ptr"

# List of common aliases that we want to apply to
aliases=(
    "arrow", "default", "ibeam", "pointer", "text", "xterm"
)

for alias in "${aliases[@]}"; do
    ln -sf "$TARGET" "$alias"
done

# Apply the theme
gsettings set org.gnome.desktop.interface cursor-theme "$THEME_NAME"

echo "✅ Done! Please log out and back in to see the changes everywhere."
