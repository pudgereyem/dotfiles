# dotfiles

Dotfiles used by @pudgereyem.

### About

- Installs node, yarn (etc) and a bunch of apps that I use
- Installs and configures zsh
- Symlinks `.zshrc` to `~/code/dotfiles/.zshrc`
- Sets a few OSX settings (optional)

> FYI: Certain Applications such as `1Password`, `Dropbox`, etc I have chosen to install manually.

### Before you do anything

1. Install Xcode Developer Tools, `xcode-select --install`
2. [Configure Git](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
3. [Generate a new SSH Key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
4. [Install Homebrew](https://brew.sh)

### Usage

```sh
git clone https://github.com/pudgereyem/dotfiles
cd dotfiles
./install.sh
```

or manually:

```sh
./brew.sh
./zsh.sh
./npm.sh
ln -sv ~/code/dotfiles/.zshrc ~
```

### Local shell config

Machine-specific paths (Flutter, adb, etc) go in `~/.zshrc.local`, which `.zshrc` sources if present. Start from the example:

```sh
cp .zshrc.local.example ~/.zshrc.local
```

### OSX settings

You can configure a few settings in OSX by running the `.macos` file. It's based on [mths.be/macos](https://mths.be/macos), but I've removed most of it to keep it simple.

```sh
./.macos
```

Make sure to walk through the file before running it!
