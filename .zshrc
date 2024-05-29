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

# pnpm
export PNPM_HOME="/Users/victormeyer/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# postgres 16
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
