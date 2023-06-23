#!/bin/bash
#SBATCH --account=hwu29
#SBATCH --nodes=1
#SBATCH --time=00:10:00
#SBATCH --partition=develgpus

# *** start of job script ***
# Note: The current working directory at this point is
# the directory where sbatch was executed.

make -j40 dd_alpha_amg
