# --- Machine-specific overlay -----------------------------------------------
[[ "$(hostname)" == *omega* && -f ~/dotfiles/omega.sh ]] && source ~/dotfiles/omega.sh
[[ -n "$NERSC_HOST" && -f ~/dotfiles/nersc.sh ]] && source ~/dotfiles/nersc.sh

# Portable core, same on every machine.
source ~/dotfiles/shared.sh
source ~/dotfiles/bash/00-core.bash

# bash-only convenience
alias src="source ~/.bashrc"

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!
case ":$PATH:" in
    *:/home/munguia/.juliaup/bin:*)
        ;;
    *)
        export PATH=/home/munguia/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac
[ -f "/home/munguia/.julia/juliaup/completions/bash.sh" ] && source "/home/munguia/.julia/juliaup/completions/bash.sh"
# <<< juliaup initialize <<<
