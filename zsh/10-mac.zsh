# macOS/Homebrew-specific config. Sourced only on machines that have
# Homebrew. Not portable -- do not add anything here you expect to
# work on NERSC/omega.

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/usr/local/texlive/2025/bin/universal-darwin:$PATH"
export PATH="/Users/patxi/omfit_env/bin:$PATH"
export PATH="$PATH:$HOME/src/chease/src-f90"

# --- Conda ---------------------------------------------------------------
__conda_setup="$('/Users/patxi/src/miniforge3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/patxi/src/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/patxi/src/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/patxi/src/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

# --- Mamba -----------------------------------------------------------------
export MAMBA_EXE='/Users/patxi/src/miniforge3/bin/mamba'
export MAMBA_ROOT_PREFIX='/Users/patxi/src/miniforge3'
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
if [ $? -eq 0 ]; then
    unalias mamba 2>/dev/null
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"
fi
unset __mamba_setup

# --- GACODE / OMFIT --------------------------------------------------------
export OMFIT_ROOT=~/src/OMFIT-source
export GACODE_PLATFORM=OSX_SEQUOIA
export GACODE_ROOT=$HOME/src/gacode

# --- Compilers ---------------------------------------------------------------
export CC=/opt/homebrew/bin/gcc-15
export CXX=/opt/homebrew/bin/g++-15
export FC=/opt/homebrew/bin/gfortran-15

# --- Mac-only aliases --------------------------------------------------------
alias omfit="~/src/omfit-source/bin/omfit_docker_osx.sh"
alias hermes3="~/src/hermes-3/build/hermes-3"
alias ae='osascript -e "quit app \"Magnet\"" && open -a AeroSpace && sleep 1 && aerospace reload-config'
alias magnet='pkill -x AeroSpace; open -a Magnet'
