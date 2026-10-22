# Dotfiles

Personal development environment managed with [chezmoi](https://www.chezmoi.io/).

## Installed Applications

### Core Tools

- git
- zsh
- tmux
- Neovim
- LazyVim

### Shell Utilities

- oh-my-posh
- zoxide
- fzf

### Development Utilities

- ripgrep
- jq
- curl
- wget
- unzip
- build-essential

### Package Managers

- apt (Ubuntu)
- Homebrew (macOS)

---

## Bootstrap

### Ubuntu

Install minimum dependencies:

```bash
sudo apt update
sudo apt install -y git curl
```

Install chezmoi:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
mkdir -p ~/.local/bin
mv ./bin/chezmoi ~/.local/bin/
export PATH="$HOME/.local/bin:$PATH"
```

Initialize dotfiles:

```bash
chezmoi init https://github.com/bkko79/dotfiles.git
chezmoi apply
```

Run installation script:

```bash
cd "$(chezmoi source-path)"
./install.sh
```

Reload shell:

```bash
exec zsh
```

---

### macOS

Install Homebrew first if needed:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install chezmoi:

```bash
brew install chezmoi
```

Initialize dotfiles:

```bash
chezmoi init https://github.com/bkko79/dotfiles.git
chezmoi apply
```

Run installation script:

```bash
cd "$(chezmoi source-path)"
./install.sh
```

---

## Verification

Check installed tools:

```bash
which git
which zsh
which tmux
which nvim
which zoxide
which oh-my-posh
```

Check Neovim:

```bash
nvim
```

Check tmux:

```bash
tmux
```

Check zoxide:

```bash
z <directory>
```

---

## Current Managed Files

```text
~/.zshrc
~/.gitconfig
~/.tmux.conf
~/.config/nvim
```

Managed using:

```bash
chezmoi add ~/.zshrc
chezmoi add ~/.gitconfig
chezmoi add ~/.tmux.conf
chezmoi add ~/.config/nvim
```

## Architecture
 
This repository separates **configuration management** from **software installation**.
 
### Components
 
#### chezmoi
 
Responsible for managing and synchronizing configuration files.
 
Managed files include:
 
```text
~/.zshrc
~/.gitconfig
~/.tmux.conf
~/.config/nvim
```
 
Workflow:
 
```text
GitHub Repository
↓
chezmoi init
↓
chezmoi apply
↓
Configuration files are deployed to the system
```
 
---
 
#### install.sh
 
Entry point for bootstrapping a new machine.
 
Purpose:
 
- Detect operating system
- Execute the appropriate installation script
- Provide a single command for environment setup
 
```text
install.sh
├── install-linux.sh
└── install-macos.sh
```
 
---
 
#### install-linux.sh
 
Ubuntu/Linux specific package installation.
 
Handles:
 
- apt packages
- Neovim installation
- zoxide installation
- oh-my-posh installation
- development dependencies
 
Example:
 
```text
git
zsh
tmux
fzf
ripgrep
jq
nodejs
npm
build-essential
```
 
---
 
#### install-macos.sh
 
macOS specific installation script.
 
Responsibilities:
 
- Install Homebrew if needed
- Install packages listed in Brewfile
- Apply macOS-specific setup
 
---
 
#### Brewfile
 
Declarative package list for macOS.
 
Benefits:
 
- Easy package synchronization
- Version-controlled package selection
- Reproducible workstation setup
 
Example:
 
```ruby
brew "git"
brew "zsh"
brew "tmux"
brew "fzf"
brew "ripgrep"
```
 
---
 
### Bootstrap Flow
 
```text
Fresh Machine
↓
Install Git + Curl
↓
Install chezmoi
↓
chezmoi init <repo>
↓
chezmoi apply
↓
Execute install.sh
↓
Install packages and tools
↓
exec zsh
↓
Ready to use
```
 
---
 
### Design Principles
 
- Git tracks configuration, not generated files.
- Configuration is OS-agnostic whenever possible.
- OS-specific logic lives in installation scripts.
- A new machine should be recoverable with minimal manual steps.
- The repository should remain the single source of truth for the development environment.