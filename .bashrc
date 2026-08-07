# --- Machine-specific overlay -----------------------------------------------
[[ -n "$NERSC_HOST" && -f ~/dotfiles/nersc.sh ]] && source ~/dotfiles/nersc.sh

# Portable core, same on every machine.
source ~/dotfiles/shared.sh
source ~/dotfiles/bash/00-core.bash

# bash-only convenience
alias src="source ~/.bashrc"
