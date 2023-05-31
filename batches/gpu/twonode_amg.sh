#!/bin/bash
#SBATCH --account=hwu29
# budget account where contingent is taken from
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
# if keyword omitted: Max. 96 tasks per node
# (SMT enabled, see comment below)
#SBATCH --cpus-per-task=20
# for OpenMP/hybrid jobs only
#SBATCH --output=/p/project/chwu29/matthaei1/output/twonode_amg_gpu-%j.log
#SBATCH --time=00:10:00
#SBATCH --partition=gpus
#SBATCH --gres=gpu:4
# For gpus and and booster partition

# *** start of job script ***
# Note: The current working directory at this point is
# the directory where sbatch was executed.

module load GCC CUDA ParaStationMPI MPI-settings/CUDA UCX-settings/RC-CUDA

jutil env activate -p chwu29
cd $PROJECT/matthaei1/DDalphaAMG_gpu
srun --cpu-bind=rank_ldom --cpus-per-task=${SLURM_CPUS_PER_TASK} \
    dd_alpha_amg $PROJECT/matthaei1/alpha-repro/inis/twonode_amg.ini
