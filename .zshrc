# On MATE desktops (e.g. NERSC ThinLinc's remote desktop), MATE Terminal
# doesn't discover Nerd Fonts no matter where they're installed or how
# fontconfig is refreshed -- p10k's glyphs just render as boxes. Bail into
# the plain bash fallback prompt instead of fighting it. Must run before
# the p10k instant-prompt block below, so nothing zsh-specific gets a
# chance to print first.
#
# ThinLinc's MATE Terminal auto-SSHes into a login node, so none of the
# usual desktop-session env vars (XDG_CURRENT_DESKTOP, VTE_VERSION, ...)
# survive the hop -- confirmed empty on the actual NERSC session. The one
# thing sshd sets from the real TCP connection (not client-forwarded, so
# it can't be scrubbed) is $SSH_CONNECTION's client IP, which lands in
# NERSC's own 128.55.0.0/16 block when it's ThinLinc rather than an
# external Mac. Fragile if that range ever changes, or if a NERSC VPN
# session happens to land in the same block -- worth rechecking if this
# ever misfires.
_ssh_client_ip="${SSH_CONNECTION%% *}"
if [[ -z "$DOTFILES_FORCE_BASH" ]] && [[ -o interactive ]] && { [[ "${XDG_CURRENT_DESKTOP:-}" == *[Mm][Aa][Tt][Ee]* ]] || [[ -n "$MATE_DESKTOP_SESSION_ID" ]] || [[ "${DESKTOP_SESSION:-}" == *mate* ]] || [[ "$_ssh_client_ip" == 128.55.* ]]; }; then
    unset _ssh_client_ip
    export DOTFILES_FORCE_BASH=1
    exec bash -l
fi
unset _ssh_client_ip

# Enable Powerlevel10k instant prompt. Must stay at the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Machine-specific overlay (first: sets up PATH, e.g. brew shellenv, ------
# --- so the portable core's `command -v` tool checks below see it) -----------
[[ "$(uname)" == "Darwin" && -f ~/dotfiles/zsh/10-mac.zsh ]] && source ~/dotfiles/zsh/10-mac.zsh
[[ "$(uname)" == "Linux" && -f ~/dotfiles/zsh/10-linux.zsh ]] && source ~/dotfiles/zsh/10-linux.zsh
[[ "$(hostname)" == *omega* && -f ~/dotfiles/omega.sh ]] && source ~/dotfiles/omega.sh
[[ -n "$NERSC_HOST" && -f ~/dotfiles/nersc.sh ]] && source ~/dotfiles/nersc.sh

# --- Portable core, same on every machine -----------------------------------
source ~/dotfiles/shared.sh
source ~/dotfiles/zsh/00-core.zsh

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

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/patxi/.juliaup/bin' $path)
export PATH
# Tab completion for juliaup and julia channel selection
[ -f "/Users/patxi/.julia/juliaup/completions/zsh.zsh" ] && source "/Users/patxi/.julia/juliaup/completions/zsh.zsh"

# <<< juliaup initialize <<<
