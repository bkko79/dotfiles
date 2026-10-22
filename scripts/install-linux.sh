#!/usr/bin/env bash

set -e

sudo apt update

sudo apt install -y \
  git \
  curl \
  wget \
  unzip \
  build-essential \
  zsh \
  tmux \
  fzf \
  jq \
  ripgrep \
  nodejs \
  npm

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

tar xzf nvim-linux-x86_64.tar.gz

sudo rm -rf /opt/nvim
sudo mv nvim-linux-x86_64 /opt/nvim
