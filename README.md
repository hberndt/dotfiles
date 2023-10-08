# Macbook Pro dotfiles and setup at GitLab

This repository contains everything to bootstrap my Macbook. .

In addition to the files stored in this repository, the following instructions are needed to fully setup a Macbook Pro.

## Preparations

### Git (XCode)

Install it on the command line first, it will ask for permission.

```bash
sudo softwareupdate -i -a
xcode-select --install
```

### iterm2

Install it manually from the [website](https://www.iterm2.com/), start it and add it to the deck.

Initial settings:

- Create a new profile in `Preferences > Profile` and import the Default.json

### Backup

Copy the following files in your home directory:

- SSH Keys
- GPG Keys
- GitHub/GitLab Tokens in `.env`
- Custom settings for OhMyZSH

```
cd backup/
cp -r .ssh .gnupg .env .oh-my-zsh .aws .azure .docker .kube $HOME/
```

> **Note**:
>
> The `dotenv` plugin is enabled in OhMyZSH which automatically
> reads the `.env` tokens from the user's home directory.

### Dot files

```bash
bash -c "`curl -fsSL https://github.com/hberndt/dotfiles/raw/main/bootstrap.sh`"
```

Apply macOS settings.

```
./.macos
```

Install Homebrew and OhMyZSH.

```
./.install_once.sh
```

Install tools and applications with Homebrew bundle.

```
brew bundle
```

This makes use of the [Brewfile](Brewfile) definitions.

## Essentials

cargo install --features pcre2 ripgrep

### Tools

## Preferences

These are manual settings as they require user awareness.

### FileVault

CLI:

```
sudo fdesetup status

sudo fdesetup enable
```

### Keyboard

`Shortcuts`: Disable Spotlight in preparation for enabling Raycast as default shortcut using `cmd + space`.

### Alfred

My Alfred license is stored in my keepass database.

### Finder

`Preferences > Sidebar` and add

- User home
- System root

## Upgrades

On major version upgrades, binaries might be incompatible or need a local rebuild.
You can enforce a reinstall by running the two commands below, the second command
only reinstalls all application casks.

```
brew reinstall $(brew list)

brew reinstall $(brew list --cask)
```

When Xcode and compilers break, re-install the command line tools.

```
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install
```
