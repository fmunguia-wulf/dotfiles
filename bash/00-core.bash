# bash-specific portable config. Sourced by .bashrc after shared.sh.

command -v fzf &>/dev/null && eval "$(fzf --bash)"

# Still no p10k equivalent here, but a bit richer than plain hostname: shows
# hostname + cwd, and the git branch when inside a repo. Colored so the
# pieces are easy to tell apart at a glance.
__prompt_git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
    printf ' (%s)' "$branch"
}
PS1='\[\e[1;36m\][\h]\[\e[0m\] \[\e[0;33m\]\w\[\e[0;32m\]$(__prompt_git_branch)\[\e[0m\] $ '
