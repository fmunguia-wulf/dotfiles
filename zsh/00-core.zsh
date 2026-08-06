# zsh-specific portable config -- works on any machine with zsh, no
# Homebrew/Mac assumptions. Sourced by .zshrc after shared.sh.

# fzf keybindings/completion (zsh-flavored; bash needs `fzf --bash`)
command -v fzf &>/dev/null && eval "$(fzf --zsh)"
