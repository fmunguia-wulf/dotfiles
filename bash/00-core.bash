# bash-specific portable config. Sourced by .bashrc after shared.sh.

command -v fzf &>/dev/null && eval "$(fzf --bash)"

# Plain, minimal prompt -- just hostname, no fanciness (bash has no p10k
# equivalent here; this is deliberately simple, e.g. reads "cybele$ ").
PS1='\h$ '
