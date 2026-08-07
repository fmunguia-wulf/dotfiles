# Sourced by both .zshrc and .bashrc. Must stay POSIX-sh compatible --
# no zsh-only syntax (setopt, (%):-%n, etc). Every external tool is
# guarded with command -v so this is safe on a machine that has none
# of them.

export PATH="$HOME/.local/bin:$PATH"

# --- Threading ---------------------------------------------------------
export OPENBLAS_NUM_THREADS=1
export GOTO_NUM_THREADS=1
export OMP_NUM_THREADS=1

# --- Aliases -------------------------------------------------------------
alias c="clear"
alias h="history"
alias j="jobs"
alias p="ps aux"
alias e="exit"
alias v="vim"
alias vi="nvim"
alias g="git"
alias s="source"
alias research="cd ~/Documents/research"
alias jdev="cd ~/.julia/dev"
alias ta="tmux attach"
alias tn="tmux new -s"
alias tl="tmux ls"

# --- Better aliases (guarded -- no-op if tool is absent) ----------------
command -v eza    &>/dev/null && alias ls='eza --icons' && alias ll='eza --icons -la'
command -v bat    &>/dev/null && alias cat='bat'
command -v rg     &>/dev/null && alias grep='rg'
command -v btop   &>/dev/null && alias top='btop'
command -v zoxide &>/dev/null && eval "$(zoxide init "$(basename "$SHELL")")"

# --- juliaup -------------------------------------------------------------
if [ -d "$HOME/.juliaup/bin" ]; then
    PATH="$HOME/.juliaup/bin:$PATH"
    export PATH
fi

# --- Local, machine-specific overrides (gitignored, see local.sh.example) --
[ -f "$HOME/dotfiles/local.sh" ] && . "$HOME/dotfiles/local.sh"

# --- Safety + ls fallback (universal, not eza-dependent) -------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
command -v eza &>/dev/null || alias ls='ls --color=auto'
command -v eza &>/dev/null || alias ll='ls -lh --color=auto'
