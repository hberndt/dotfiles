#!/bin/bash
# Dotfiles update script
system_files=(
  "$HOME/.gitconfig"
  "$HOME/.vimrc"
  "$HOME/.zshrc"
  "$HOME/.oh-my-zsh/custom/aliases.zsh"
  "$HOME/.oh-my-zsh/custom/path.zsh"
  "$HOME/.tmux.conf"
  "$HOME/.config/doom/init.el"
  "$HOME/.config/doom/config.el"
  "$HOME/.config/doom/packages.el"
  "$HOME/.config/doom/README.org"
  "$HOME/.vimruntime/my_configs.vim"
)

repo_files=(
  "gitconfig"
  "vimrc"
  "zshrc"
  "oh-my-zsh/custom/aliases.zsh"
  "oh-my-zsh/custom/path.zsh"
  "tmux.conf"
  "doom.d/init.el"
  "doom.d/config.el"
  "doom.d/packages.el"
  "doom.d/README.org"
  "my_configs_vim"
)

compare() {
    if [[ -f "$2" ]]; then
        cmp "$1" "$2" > /dev/null
        result=$?
        if [[ $result == 1 ]]; then
            cp "$1" "$2" > /dev/null
            printf "\e[92;1mChanged -- \e[95m%s\n" "$2"
            git add "$2"
        elif [[ $result == 0 ]]; then
            printf "\e[33mUnchanged -- \e[93m%s\n" "$2"
        fi
    else
        printf "\e[92;1mAdded -- \e[95m%s\n" "$2"
        cp "$1" "$2" > /dev/null
        git add "$2"
    fi
}

printf "\e[93;1mThis script will overwrite the contents of this repository with\n"
printf "\e[93;1mwhatever is in the standard config locations for this user.\n\n"
printf "\e[94;1mIt will also add any changed files to the repo's staging area.\n\n"
printf "\e[91;1mContinue? (Y/N) "
read contin
if [[ $contin == "y" || $contin == "Y" ]]; then
    printf "\e[92;1mContinuing...\n"
    for ((i=0;i<${#system_files[@]};++i)); do
        sys="${system_files[i]}"
        rep="${repo_files[i]}"
        if [[ -f "$sys" ]]; then
            compare "$sys" "$rep"
        else
            continue
        fi
    done
    printf "\e[93;1mFinished fetching\n"
    git add "$0"
    unset compare
    true
else
    printf "\e[91;mFetch cancelled\n"
    unset compare
    false
fi
