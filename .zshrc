# Shell helpers
_has() { command -v "$1" >/dev/null 2>&1 }

# Homebrew shell environment, when available.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# uv installs default python/pip shims into ~/.local/bin.
[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" "${path[@]}")

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX="true"

plugins=(git node colorize)
[[ -d "$ZSH/custom/plugins/git-open" ]] && plugins+=(git-open)
[[ -d "$ZSH/custom/plugins/zsh-completions" ]] && plugins+=(zsh-completions)
[[ -d "$ZSH/custom/plugins/zsh-autosuggestions" ]] && plugins+=(zsh-autosuggestions)
[[ -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]] && plugins+=(zsh-syntax-highlighting)

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
else
  autoload -Uz compinit && compinit
fi

# History
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY        # share history across open shells
setopt INC_APPEND_HISTORY   # append as commands run, not on exit
setopt HIST_IGNORE_SPACE    # don't record commands prefixed with a space

# Editor
export EDITOR="code --wait"
export VISUAL="$EDITOR"

# fnm (node versions)
_has fnm && eval "$(fnm env --use-on-cd --shell zsh)"

# zoxide (smarter cd — use `z <dir>` to jump)
_has zoxide && eval "$(zoxide init zsh)"

# eza (smarter ls)
if _has eza; then
  alias ls='eza --group-directories-first --icons'
  alias ll='eza --long --git --group-directories-first --icons'
  alias la='eza --long --git --all --group-directories-first --icons'
  alias tree='eza --tree --icons'
fi

# bat (smarter file preview)
_has bat && alias ccat='bat --paging=never'

# fzf (fuzzy finder)
if [[ -o interactive && -t 0 && -t 1 && "$TERM" != "dumb" ]] && _has fzf; then
  source <(fzf --zsh)
fi

# Do ls after cd
chpwd() {
  ls
}

fpath=($fpath "$HOME/.zfunctions")

# Starship prompt
if [[ -o interactive && "$TERM" != "dumb" ]] && _has starship; then
  eval "$(starship init zsh)"
fi

# Machine-local settings (Flutter, adb, etc) — see .zshrc.local.example
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
