# Phillipp's Dotfiles

## Chezmoi

- This repository is managed with [chezmoi](https://www.chezmoi.io/).
- The source directory, `~/.local/share/chezmoi`

```bash

# checks for common problems. If you encounter something unexpected, run this first.
$ chezmoi doctor

# gives a quick summary of what files would change if you ran chezmoi apply.
$ chezmoi status

# adds $FILE from your **home directory** to the source directory.
$ chezmoi add $FILE

# change to chezmoi source directory
$ chezmoi cd

# Pull the latest changes from your repo and apply them
$ chezmoi update

# If you're happy with the changes, then you can run
$ chezmoi apply [--dry-run]

```

### Installation

On another machine you can checkout this repo:

```
$ chezmoi init git@github.com:phillippbertram/dotfiles.git
```

## Brews

wget
curl

Check if brew is available

- vscode

## install zsh with oh-my-zsh

```bash
$ brew install zsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
