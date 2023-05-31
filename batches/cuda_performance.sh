#!/bin/bash
#SBATCH --account=hwu29
# budget account where contingent is taken from
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
# if keyword omitted: Max. 96 tasks per node
# (SMT enabled, see comment below)
#SBATCH --cpus-per-task=1
# for OpenMP/hybrid jobs only
#SBATCH --output=/p/project/chwu29/matthaei1/output/cuda_performance-%j.log
#SBATCH --time=00:10:00
#SBATCH --partition=develgpus
#SBATCH --gres=gpu:1
# For gpus and and booster partition

# *** start of job script ***
# Note: The current working directory at this point is
# the directory where sbatch was executed.

module load CUDA
jutil env activate -p chwu29
$PROJECT/matthaei1/cuda_performance/computation
