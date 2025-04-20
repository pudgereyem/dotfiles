#!/usr/bin/env bash

# Install stuff
./brew.sh

# Configure zsh
./zsh.sh

# Configure iterm
./iterm.sh

# Install npm packages
./npm.sh

# symlink zshrc file
ln -sv ~/code/dotfiles/.zshrc ~