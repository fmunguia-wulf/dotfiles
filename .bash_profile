# Login shell entry point. On machines where the account's default shell
# is bash but zsh is actually available (e.g. omega.gat.com, whose passwd
# record disagrees with somega's), hand off to zsh so p10k loads without
# typing `zsh` by hand. No-op on machines with no zsh (Cybele).

# Machine-specific login setup (LMOD, experiment/DB env vars, site PATH
# additions, etc.) that must run before we potentially hand off to zsh below,
# so anything it exports still carries over via the exec into the new process.
[ -f "$HOME/.bash_profile.local" ] && . "$HOME/.bash_profile.local"

if [ -z "$ZSH_VERSION" ] && [ -t 0 ]; then
    if command -v zsh >/dev/null 2>&1; then
        exec zsh -l
    fi
fi

source ~/dotfiles/shared.sh
source ~/dotfiles/bash/00-core.bash

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
