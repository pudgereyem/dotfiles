#!/usr/bin/env bash

# Download latest
git pull origin master

# Install stuff
./brew.sh

# Configure zsh
./zsh.sh

# Configure iterm
./iterm.sh

# symlink zshrc file
ln -sv ~/code/dotfiles/.zshrc ~

# Install npm packages
./npm.sh
