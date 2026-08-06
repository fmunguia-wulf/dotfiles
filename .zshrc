# Enable Powerlevel10k instant prompt. Must stay at the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Portable core, same on every machine -----------------------------------
source ~/dotfiles/shared.sh
source ~/dotfiles/zsh/00-core.zsh

# --- Machine-specific overlay -------------------------------------------------
[[ "$(uname)" == "Darwin" && -f ~/dotfiles/zsh/10-mac.zsh ]] && source ~/dotfiles/zsh/10-mac.zsh
[[ "$(uname)" == "Linux" && -f ~/dotfiles/zsh/10-linux.zsh ]] && source ~/dotfiles/zsh/10-linux.zsh

# --- Powerlevel10k ---------------------------------------------------------
if [[ -f ~/src/powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source ~/src/powerlevel10k/powerlevel10k.zsh-theme
elif [[ -f $(brew --prefix powerlevel10k 2>/dev/null)/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source $(brew --prefix powerlevel10k)/share/powerlevel10k/powerlevel10k.zsh-theme
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- iTerm2 shell integration (Mac-only, guarded) --------------------------
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh-only convenience
alias src="source ~/.zshrc"
