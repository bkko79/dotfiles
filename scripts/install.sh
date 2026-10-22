#!/usr/bin/env bash

set -e

OS="$(uname)"

case "$OS" in
Linux)
  ./install-linux.sh
  ;;
Darwin)
  ./install-macos.sh
  ;;
*)
  echo "Unsupported OS"
  exit 1
  ;;
esac
