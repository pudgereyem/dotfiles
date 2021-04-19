# dotfiles

Dotfiles used by @pudgereyem.

### About

- Installs homebrew
- Installs git, yarn, node (etc) and a bunch of apps that I use
- Installs and configures zsh
- Installs a few vscode plugins
- Symlinks `.zshrc` to `~/code/dotfiles/.zshrc`
- Sets a few OSX settings (optional)

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
./vscode.sh
ln -sv ~/code/dotfiles/.zshrc ~
```

### OSX settings

You can configure a few settings in OSX by running the `.macos` file. It's based on [mths.be/macos](https://mths.be/macos), but I've removed most of it to keep it simple.

```sh
./.macos
```

Make sure to walk through the file before running it!
