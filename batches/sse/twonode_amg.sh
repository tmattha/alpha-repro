#!/bin/bash
#SBATCH --account=hwu29
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=10
#SBATCH --output=/p/project/chwu29/matthaei1/output/twonode_amg_sse-%j.log
#SBATCH --time=00:10:00
#SBATCH --partition=gpus

# *** start of job script ***
# Note: The current working directory at this point is
# the directory where sbatch was executed.

module load GCC ParaStationMPI MPI-settings/CUDA UCX-settings/RC-CUDA

jutil env activate -p chwu29
cd $PROJECT/matthaei1/DDalphaAMG_sse
srun --distribution=block:cyclic:fcyclic --cpus-per-task=${SLURM_CPUS_PER_TASK} \
    dd_alpha_amg $PROJECT/matthaei1/alpha-repro/inis/twonode_amg.ini
