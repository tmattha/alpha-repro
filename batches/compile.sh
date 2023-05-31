#!/bin/bash
#SBATCH --account=hwu29
# budget account where contingent is taken from
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
# if keyword omitted: Max. 96 tasks per node
# (SMT enabled, see comment below)
#SBATCH --cpus-per-task=40
# for OpenMP/hybrid jobs only
#SBATCH --time=00:10:00
#SBATCH --partition=develgpus

# *** start of job script ***
# Note: The current working directory at this point is
# the directory where sbatch was executed.

make -j40 dd_alpha_amg
