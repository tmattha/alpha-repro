#!/bin/bash
#SBATCH --account=hwu29
# budget account where contingent is taken from
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
# if keyword omitted: Max. 96 tasks per node
# (SMT enabled, see comment below)
#SBATCH --cpus-per-task=10
# for OpenMP/hybrid jobs only
#SBATCH --output=/p/project/chwu29/matthaei1/output/query-system-%j.log
#SBATCH --time=00:10:00
#SBATCH --partition=develgpus
#SBATCH --gres=gpu:4
# For gpus and and booster partition

# *** start of job script ***
# Note: The current working directory at this point is
# the directory where sbatch was executed.

module load CUDA

echo "\n\n-- CPU ---------------------"

lscpu

echo "\n\n-- GPUs --------------------"

echo "\n>>>> Topology <<<<"

nvidia-smi topo -m

nvidia-smi -q

echo "\n\n-- Memory ------------------"

cat /proc/meminfo
