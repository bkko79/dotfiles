#!/usr/bin/env bash

brew bundle

# Xcode CLI Tools
xcode-select -p >/dev/null 2>&1 || xcode-select --install

brew bundle