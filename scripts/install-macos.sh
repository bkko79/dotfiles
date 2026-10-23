#!/usr/bin/env bash

# Xcode CLI Tools
xcode-select -p >/dev/null 2>&1 || xcode-select --install

# Brewfile
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
brew bundle --file="$SCRIPT_DIR/Brewfile"
