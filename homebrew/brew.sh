#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

# Run this (or similar) before running this file, to install brew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade
brew bundle 
brew cleanup
