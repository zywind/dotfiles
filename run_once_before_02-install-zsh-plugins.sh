#!/bin/bash
# Clones the custom Oh My Zsh plugins referenced in .zshrc's plugins=(...) line.
# run_once_: runs a single time per machine (tracked by chezmoi).
set -eufo pipefail

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone() {
  local url="$1" dir="$2"
  if [ ! -d "$dir" ]; then
    git clone --depth 1 "$url" "$dir"
  fi
}

clone https://github.com/Aloxaf/fzf-tab                 "$ZSH_CUSTOM/plugins/fzf-tab"
clone https://github.com/zsh-users/zsh-autosuggestions  "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
