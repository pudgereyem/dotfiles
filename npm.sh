#!/usr/bin/env bash

# Install node using fnm
eval "$(fnm env)"
fnm install 18.18.2
fnm use 18.18.2

# Install packages
npm install -g yarn

