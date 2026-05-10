#!/bin/bash

#SBATCH --job-name=MCMCtree_Vespinae
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --time=infinite
#SBATCH --output=mcmctree.%j.out
#SBATCH --error=mcmctree.%j.err

# --- Umgebung vorbereiten ---
conda activate iqtree

# Befehl 

mcmctree Pmodel_Vespinae.mcmctree.ctl