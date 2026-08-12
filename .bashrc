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
    *:/Users/patxi/.juliaup/bin:*)
        ;;

    *)
        export PATH=/Users/patxi/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac
# Tab completion for juliaup and julia channel selection
[ -f "/Users/patxi/.julia/juliaup/completions/bash.sh" ] && source "/Users/patxi/.julia/juliaup/completions/bash.sh"

# <<< juliaup initialize <<<
