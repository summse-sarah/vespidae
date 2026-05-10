#!/bin/bash

#SBATCH --job-name=IQ2MC_Prep
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=INFINITE
#SBATCH --output=iq2mc_prep.%j.out
#SBATCH --error=iq2mc_prep.%j.err

# --- Umgebung vorbereiten ---

conda activate iqtree

#  Demotte et al. (2025)
# --dating mcmctree: makes Hessian-Matrix 
iqtree3 \
  -s concatenated.out \
  -p partitions.txt \
  -te PmodelTree2_fixed.nwk \
  -m HKY+G4 \
  --dating mcmctree \
  -T AUTO \
  --prefix Pmodel_Vespinae