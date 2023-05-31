#!/bin/bash
#SBATCH --account=hwu29
# budget account where contingent is taken from
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
# if keyword omitted: Max. 96 tasks per node
# (SMT enabled, see comment below)
#SBATCH --cpus-per-task=16
# for OpenMP/hybrid jobs only
#SBATCH --output=/p/project/chwu29/matthaei1/output/mapbind/processCostsB-%j.log
#SBATCH --time=00:10:00
#SBATCH --partition=develgpus
#SBATCH --gres=gpu:4
# For gpus and and booster partition

# *** start of job script ***
# Note: The current working directory at this point is
# the directory where sbatch was executed.

module load GCC CUDA ParaStationMPI MPI-settings/CUDA UCX-settings/RC-CUDA

jutil env activate -p chwu29
cd $PROJECT/matthaei1/DDalphaAMG_cpu
srun --cpus-per-task=${SLURM_CPUS_PER_TASK} \
    perf stat -e cache-misses,cache-references,instructions,cycles -- \
    ./dd_alpha_amg $PROJECT/matthaei1/alpha-repro/inis/mapbind/processCostsB.ini
