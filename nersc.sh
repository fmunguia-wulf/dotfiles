# NERSC-specific config. Sourced by both .zshrc and .bashrc, guarded by
# $NERSC_HOST (set automatically by NERSC on every login node/compute node).

export SCRATCH="/pscratch/sd/p/patxi"
export CSCRATCH=/cscratch/$USER

alias ips_env='module load python && conda activate /global/common/software/atom/perlmutter/cesol/conda/dev'
alias ips_runs='cd $SCRATCH/ips-fastran/runs'
alias scratch='cd $SCRATCH'
alias cscratch='cd $SCRATCH'
alias cfs='cd /global/cfs/cdirs/m3747/patxi'
alias runs='cd $SCRATCH/ips-fastran/runs'
alias qme='squeue -u $USER'
alias qall='squeue -u $USER --start'
