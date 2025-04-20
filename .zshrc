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

ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

# Do ls after cd
chpwd() {
  ls
}

eval $(/opt/homebrew/bin/brew shellenv)

# https://github.com/Schniz/fnm#zsh
eval "$(fnm env --use-on-cd)"

fpath=($fpath "/Users/victormeyer/.zfunctions")

eval "$(starship init zsh)"

# load local settings if there are any
# I place specific code that I don't necessarily want to have in my next computer here, e.g `export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home`
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
