#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install languages etc
brew install zsh
brew install fnm
brew install tree
brew install starship

# Install apps
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask spotify
brew install --cask slack
brew install --cask iterm2
brew install --cask droplr
brew install --cask obsidian
brew install --cask rectangle
brew install --cask github

# Install fonts
brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font

brew cleanup
