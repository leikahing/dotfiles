#!/usr/bin/env bash

YELLOW='\033[1;33m'

cd "$(dirname "${BASH_SOURCE}")"

function installFonts() {
    printf "${YELLOW}Installing fonts..."
    rsync -avh --no-perms fonts/ ${HOME}/Library/Fonts
    printf "${YELLOW}DONE!\n"
}

function setupHome() {
    printf "${YELLOW}Setting up home..."
    rsync --exclude "README.md" \
          --exclude ".git/" \
          --exclude "fonts/" \
          -avh --no-perms . ${HOME}
    printf "${YELLOW}DONE!\n"
    exec zsh
}


read -p "This will probably overwrite some stuff. Good to go? " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    installFonts
    setupHome
fi
unset installFonts
unset setupHome
