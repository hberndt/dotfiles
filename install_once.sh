#!/bin/sh

# This installs homebrew itself, and also the command line tools in silent mode
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp oh-my-zsh/custom/* ~/.oh-my-zsh/custom
cp ssh ~/.ssh
cp gitconfig ~/.gitconfig
cp gitignore ~/.gitignore
cp zshrc ~/.zshrc

brew bundle

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install


git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime

sh ~/.vim_runtime/install_awesome_vimrc.sh

cp my_configs.vim ~/.vim_runtime