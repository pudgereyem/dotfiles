#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Taps
brew tap homebrew/cask-fonts

# Install languages etc
brew install zsh
brew install node
brew install yarn

# Install apps
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask spotify
brew install --cask slack
brew install --cask iterm2
brew install --cask sizeup
brew install --cask tower
brew install --cask docker
brew install --cask sequel-pro
brew install --cask notable

# Install fonts
brew install --cask font-fira-code

brew cleanup
