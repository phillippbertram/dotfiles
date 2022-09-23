#!/bin/sh

set -e # -e: exit on error

GITHUB_USERNAME=phillippbertram

if [ ! "$(command -v chezmoi)" ]; then
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://chezmoi.io/get)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi