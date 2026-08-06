# dotfiles

My shell config. Symlinked into `$HOME` so this repo is the source of truth.

## Layout

- `shared.sh` — POSIX-sh, sourced by both zsh and bash. No zsh-only syntax.
- `zsh/00-core.zsh`, `bash/00-core.bash` — portable, shell-specific core (no Mac/Linux assumptions)
- `zsh/10-mac.zsh` — Mac-only overlay (Homebrew paths, macOS-specific config, compilers)
- `zsh/10-linux.zsh` — Linux-only overlay (clusters, workstations)
- `local.sh` (gitignored, see `local.sh.example`) — machine-specific secrets/paths that never get committed
- `.zshrc`, `.bashrc`, `.zprofile`, `.p10k.zsh`, `.gitconfig` — the actual files symlinked to `~/`
- `fonts/` — Nerd Font files not available via a package manager (tracked with git-lfs)

Every external tool (`fzf`, `eza`, `bat`, `zoxide`, ...) is guarded with `command -v`, so this is
safe to source on a bare machine that has none of them — a fresh cluster login node included.

## Install

```bash
git clone https://github.com/fmunguia-wulf/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

Symlinks the dotfiles in, backing up anything already at `~/.zshrc` etc. to a timestamped
`.backup.<timestamp>` file. Safe to re-run — already-correct symlinks are left alone.
On macOS it also installs the fonts. Restart your terminal after.

For machine-specific config (cluster tokens, per-host paths) that shouldn't be committed:

```bash
cp local.sh.example local.sh
```

Neovim config is a separate repo, not part of this:

```bash
git clone https://github.com/fmunguia-wulf/kickstart.nvim.git ~/.config/nvim
```
