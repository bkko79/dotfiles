#!/usr/bin/env bash

set -e
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname)"

case "$OS" in
Linux)
  "$ROOT_DIR/scripts/install-linux.sh"
  ;;
Darwin)
  "$ROOT_DIR/scripts/install-macos.sh"
  ;;
esac