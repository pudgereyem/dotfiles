# Path to your oh-my-zsh installation.
export ZSH="/Users/victormeyer/.oh-my-zsh"

plugins=(
  git
  node
  yarn
  git-extras
  colorize
  zsh-syntax-highlighting
  zsh-autosuggestions
  git-open
)

ZSH_THEME=spaceship
ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

# Do ls after cd
chpwd() {
  ls
}

eval $(/opt/homebrew/bin/brew shellenv)

# https://github.com/Schniz/fnm#zsh
eval "$(fnm env --use-on-cd)"
