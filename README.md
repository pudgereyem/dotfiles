# dotfiles

Dotfiles used by @pudgereyem.

### About

- Installs Homebrew (if missing) and everything in the `Brewfile` (CLI tools, apps, fonts)
- Installs and configures zsh (oh-my-zsh + plugins, starship prompt)
- Installs Node via `fnm` and a default Python via `uv`
- Symlinks `.zshrc`, `.gitconfig` and `.gitignore_global` into `~`
- Points iTerm2 at the profile in `iterm2_profile/`
- Sets a few OSX settings (optional)

> FYI: Certain Applications such as `1Password`, `Dropbox`, etc I have chosen to install manually.

### New machine setup

1. Sign into your password manager and browser first — everything else
   authenticates through them. If using 1Password, enable its SSH agent
   (Settings → Developer → _Use the SSH agent_).
2. Install Xcode Command Line Tools (Homebrew needs them):
   ```sh
   xcode-select --install
   ```
3. Clone and install:
   ```sh
   git clone https://github.com/pudgereyem/dotfiles ~/code/dotfiles
   cd ~/code/dotfiles
   ./install.sh
   ```
4. Restart the terminal (or run `exec zsh`), then authenticate GitHub:
   ```sh
   gh auth login
   ```
   Git uses `gh` as its credential helper, so this covers git push/pull too.
5. Optional: turn on commit signing via 1Password — steps are commented
   inline in `.gitconfig`.
6. Review and run the OSX settings (see below), then log out/in.

Re-running `./install.sh` later is idempotent — it re-applies everything safely.

### Local shell config

Machine-specific paths (Flutter, adb, etc) go in `~/.zshrc.local`, which `.zshrc` sources if present. `install.sh` seeds it from the example on first run:

```sh
cp .zshrc.local.example ~/.zshrc.local
```

### OSX settings

You can configure a few settings in OSX by running the `.macos` file. It's based on [mths.be/macos](https://mths.be/macos), but I've removed most of it to keep it simple.

```sh
./.macos
```

Make sure to walk through the file before running it!
