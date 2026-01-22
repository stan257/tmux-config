#!/bin/bash

# Variables
CONF_SRC="$(pwd)/.tmux.conf"
CONF_DEST="$HOME/.tmux.conf"
TPM_DIR="$HOME/.tmux/plugins/tpm"

echo "🔧 Starting Tmux Setup..."

# 1. Backup existing config
if [ -f "$CONF_DEST" ] && [ ! -L "$CONF_DEST" ]; then
    echo "Backing up existing config to ~/.tmux.conf.bak"
    mv "$CONF_DEST" "$CONF_DEST.bak"
fi

# 2. Symlink the new config
echo "Linking new configuration..."
rm -f "$CONF_DEST"
ln -s "$CONF_SRC" "$CONF_DEST"

# 3. Install Plugin Manager (Essential for navigation/theme)
if [ ! -d "$TPM_DIR" ]; then
    echo "Cloning Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM already installed."
fi

echo ""
echo "Setup Complete!"
echo "CRITICAL FINAL STEP: Open tmux and press 'Ctrl+a' then 'I' (capital i) to install plugins."
