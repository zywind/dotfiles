#!/bin/bash
# Installs Oh My Zsh unattended, without touching the chezmoi-managed .zshrc.
# run_once_: runs a single time per machine (tracked by chezmoi).
set -eufo pipefail

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  # KEEP_ZSHRC=yes  -> don't overwrite the .zshrc chezmoi manages
  # RUNZSH=no       -> don't drop into a new shell at the end
  # CHSH=no         -> don't change the login shell
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
