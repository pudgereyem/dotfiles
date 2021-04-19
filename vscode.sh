#!/usr/bin/env bash

LINK_TARGET_EXISTS_HANDLING=""
while true; do
    read -p "$(echo -e 'If files exist or are already symlinked, do you want to replace?\nAnswer [y]es, [n]o, or [p]rompt: ')" yn
    case $yn in
        [Yy]* ) LINK_TARGET_EXISTS_HANDLING="f"; break;;
        [Nn]* ) LINK_TARGET_EXISTS_HANDLING=""; break;;
        [Pp]* ) LINK_TARGET_EXISTS_HANDLING="i"; break;;
        * ) echo "Please answer: ";;
    esac
done

# Plugins
code --install-extension patbenatar.advanced-new-file
code --install--extension bungcip.better-toml
code --install-extension wmaurer.change-case
code --install-extension mikestead.dotenv
code --install-extension dracula-theme.theme-dracula
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install--extension graphql.vscode-graphql
code --install-extension esbenp.prettier-vscode
code --install--extension bungcip.prisma.prisma
code --install-extension alefragnani.project-manager
code --install--extension bungcip.matklad.rust-analyzer
code --install--extension whtouche.vscode-js-console-utils


# Settings
ln -sv${LINK_TARGET_EXISTS_HANDLING} "${HOME}/code/dotfiles/.vscode.settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sv${LINK_TARGET_EXISTS_HANDLING} "${HOME}/code/dotfiles/.vscode.keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"
