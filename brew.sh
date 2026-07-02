#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew if missing (fresh machine)
if ! command -v brew &>/dev/null && [ ! -x /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we're using the latest Homebrew, then install everything declared
# in the Brewfile. Re-running is idempotent.
brew update
brew bundle --file="$DOTFILES_DIR/Brewfile"

brew cleanup
