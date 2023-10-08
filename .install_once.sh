#!/bin/sh

# This installs homebrew itself, and also the command line tools in silent mode
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .oh-my-zsh/custom/* ~/.oh-my-zsh/custom

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

brew bundle

ln -s /opt/homebrew/opt/emacs-mac/Emacs.app /Applications/Emacs.app