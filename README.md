# Dotfiles

Cross-platform shell, tmux, Git, mise, and LazyVim configuration managed with
[chezmoi](https://www.chezmoi.io/). The same user-level tools are installed by
mise on macOS and Linux; Homebrew or apt only provides the platform bootstrap.

## What owns what

- **chezmoi:** configuration files and repeatable setup scripts
- **mise:** Node, Bun, uv, Neovim, kubectl, and portable development CLIs
- **Homebrew (macOS):** git, tmux, mise, chezmoi, iTerm2, fonts, and `ouch`
- **apt (Ubuntu/Linux):** certificates, curl, git, tmux, zsh, and build tools
- **dev-machine:** ephemeral credentials and managed shell hooks in
  `/opt/devmachine_assets`

Terraform, fnm, and ugrep are intentionally not installed. Node version files
such as `.nvmrc` and `.node-version` are handled by mise.
The Linux bootstrap enforces mise 2026.7.6 or newer because the tool registry
used by this configuration requires entries bundled with that release.

## Bootstrap a new macOS machine

Install Apple's command-line tools if necessary:

```sh
xcode-select --install
```

Install chezmoi and apply this repository:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"  # Apple Silicon
brew install chezmoi
chezmoi init --apply zywind/dotfiles
```

On an Intel Mac, use `eval "$(/usr/local/bin/brew shellenv)"` instead. Chezmoi
prompts once for the Git name and email stored in its local configuration.

## Bootstrap a new Ubuntu/Linux machine

```sh
sudo apt-get update
sudo apt-get install -y ca-certificates curl git
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
chezmoi init --apply zywind/dotfiles
```

The chezmoi scripts install the remaining apt packages, mise, Oh My Zsh, tmux
plugins, the common mise toolset, and LazyVim's prerequisites.

## Bootstrap or recover a dev-machine pod

Connect normally first so dev-machine installs its stable shell and credential
hooks:

```sh
dev-machine connect
```

Inside the pod, use the Ubuntu bootstrap above. For non-interactive setup, pass
the template values explicitly:

```sh
chezmoi init --apply zywind/dotfiles \
  --promptString name='Yunfeng Zhang' \
  --promptString email='yunzhang@nvidia.com'
```

If mise is installed but not found from a recovery Bash shell:

```sh
export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$PATH"
mise install
exec zsh -l
```

## Day-to-day updates

Preview and apply changes:

```sh
chezmoi diff
chezmoi apply
```

Edit the source repository and inspect its Git state:

```sh
chezmoi cd
git status
```

Update tool versions declared as `latest`, then remove unused cached versions:

```sh
mise upgrade
mise prune
```

## Verify a machine

```sh
zsh -lic 'mise doctor; mise ls --current'
zsh -lic 'node --version; uv --version; nvim --version | head -1'
nvim --headless '+Lazy! sync' +qa
tmux source-file ~/.tmux.conf
```

LazyVim bootstraps plugins on first launch. Project-level `mise.toml` or
`.mise.toml` files override the global versions in `~/.config/mise/config.toml`.
SSH commit signing expects `~/.ssh/id_ed25519.pub`; generate or restore that key
before creating signed commits on a new personal workstation.
