#!/bin/bash
# Install TPM and the tmux plugins declared in .tmux.conf by cloning them
# directly (TPM's bin/install_plugins needs a running tmux server, which isn't
# available during `chezmoi apply`). TPM loads any plugin present here on start.
# run_once_: runs a single time per machine (tracked by chezmoi).
set -eufo pipefail

PLUGINS="$HOME/.tmux/plugins"
clone() { [ -d "$2" ] || git clone --depth 1 "$1" "$2"; }

clone https://github.com/tmux-plugins/tpm            "$PLUGINS/tpm"
clone https://github.com/tmux-plugins/tmux-resurrect "$PLUGINS/tmux-resurrect"
clone https://github.com/tmux-plugins/tmux-continuum "$PLUGINS/tmux-continuum"
