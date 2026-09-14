# NERSC-specific config. Sourced by both .zshrc and .bashrc, guarded by
# $NERSC_HOST (set automatically by NERSC on every login node/compute node).

export SCRATCH="/pscratch/sd/p/patxi"
export CSCRATCH=/cscratch/$USER


# Conda Envrionments
alias ips_env='module load python && conda activate /global/common/software/atom/perlmutter/cesol/conda/dev'
alias hermes_env='module load python && conda activate /global/cfs/cdirs/m3747/patxi/conda-envs/hermes/'

# Dir. Locations
alias ips_runs='cd $SCRATCH/ips-fastran/runs'
alias scratch='cd $SCRATCH'
alias cscratch='cd $SCRATCH'
alias cfs='cd /global/cfs/cdirs/m3747/patxi'
alias runs='cd $SCRATCH/ips-fastran/runs'

# Sbatch commands
alias qme='squeue -u $USER'
alias qall='squeue -u $USER --start'

# Fresh subshells (tmux new-window, salloc, srun --pty) don't go through the
# login-only /etc/profile.d/*.sh where Lmod defines `module`/`ml` on this
# system. Bootstrap it directly if missing, so module commands always work
# regardless of how the shell was spawned.
command -v module >/dev/null 2>&1 || source /opt/cray/pe/lmod/lmod/init/zsh

# Neovim 0.12+ tries to auto-detect terminal background color via a DSR
# query at startup; over SSH the round-trip is often too slow to get an
# answer in time, producing a harmless "did not respond to DSR" warning.
export NVIM_NOTTYFAST=1
