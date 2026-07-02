#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew + everything in the Brewfile
"$DOTFILES_DIR/brew.sh"

# Put Homebrew on PATH so the scripts below (and their tools like fnm)
# resolve, even on a first install where ~/.zshrc hasn't been sourced yet.
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Configure zsh
"$DOTFILES_DIR/zsh.sh"

# Configure iterm
"$DOTFILES_DIR/iterm.sh"

# Install node + a default python
"$DOTFILES_DIR/npm.sh"

# Symlink dotfiles
mkdir -p "$HOME/.config"
ln -sfnv "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sfnv "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sfnv "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
ln -sfnv "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

# Seed machine-local zsh config on first run (never overwritten)
if [ ! -e "$HOME/.zshrc.local" ]; then
  cp -v "$DOTFILES_DIR/.zshrc.local.example" "$HOME/.zshrc.local"
fi
