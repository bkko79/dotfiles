#!/usr/bin/env bash

set -e

OS="$(uname)"

case "$OS" in
Linux)
  ./scripts/install-linux.sh
  ;;
Darwin)
  ./scripts/install-macos.sh
  ;;
*)
  echo "Unsupported OS"
  exit 1
  ;;
esac
