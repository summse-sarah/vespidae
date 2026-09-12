# vespidae
uce based phylogeny with social parasites from the subfamilies polistinae and vespinae
# Data and Scripts for: Mode and tempo of social parasite speciation in eusocial wasps 



This repository contains the analysis scripts and associated files for the manuscript:
> **Mode and tempo of social parasite speciation in eusocial wasps**
> [von Adelmannsfelden S, Gotzek G, Härtel MP, Rabeling C]
> *Submitted to Proceedings B*

This study investigates evolution of social parasitism in vespidae. This repository provides all necessary files to replicate the phylogenetic and dating analyses presented in the paper.

## Data Availability

The raw, trimmed sequence reads used in this study are deposited in the NCBI Sequence Read Archive (SRA). Depositing raw data in a public archive is a standard practice to ensure scientific reproducibility.
*   **BioProject Accession:** `[Enter code PRJNAxxxxxx]`
*   **SRA Accessions:** `[Enter code SRRxxxxxxx, SRRxxxxxxx]`

## Repository Contents

```
.
├── README.md
├── alignments_and_partitions
│   ├── concatenated.out
│   └── partitions.txt
├── tree_inference
│   ├── start_iqtree.sh
│   └── Pmodel_Vespinae.treefile
└── dating_analysis
    ├── start_mcmctree.sh
    └── Pmodel_Vespinae.mcmctree.ctl
```

*   `README.md`: This file, providing an overview and instructions.
*   `/alignments_and_partitions`: Contains the final alignment and the partitioning scheme.
    *   `concatenated.out`: The concatenated alignment of all loci in FASTA format.
    *   `partitions.txt`: The file defining the SWSC-EN partitioning scheme for IQ-TREE.
*   `/tree_inference`: Contains files for the phylogenetic tree inference.
    *   `start_iqtree.sh`: The shell script to run the IQ-TREE analysis.
    *   `Pmodel_Vespinae.treefile`: The resulting maximum likelihood tree from the IQ-TREE analysis.
*   `/dating_analysis`: Contains files for the MCMCtree divergence time estimation.
    *   `start_mcmctree.sh`: The shell script to run the MCMCtree analysis.
    *   `Pmodel_Vespinae.mcmctree.ctl`: The control file for MCMCtree, containing all parameters and calibrations for the analysis.

## Analysis Workflow

To reproduce the analysis from start to finish, follow the steps below.

### Step 1: Phylogenetic Tree Inference with IQ-TREE

The tree inference is performed using the script in the `tree_inference` directory. This script takes the alignment and partition files as input.

```bash
# Change into the tree inference directory
cd tree_inference

# Execute the IQ-TREE script
./start_iqtree.sh
```

This step will generate the `Pmodel_Vespinae.treefile` tree file.

### Step 2: Divergence Time Estimation with MCMCtree

The dating analysis with MCMCtree involves two sub-steps.

**2a. Calculate Gradients and the Hessian Matrix**

MCMCtree requires the gradients and Hessian matrix, which can be calculated using IQ-TREE. Use the script in the `dating_analysis` directory for this purpose.

```bash
# Change into the dating analysis directory
cd dating_analysis

# Execute the IQ-TREE script to compute the Hessian matrix
./start_iqtree_hessian.sh 
```

**2b. Run the MCMCtree Analysis**

Once the Hessian matrix has been computed, the main MCMCtree analysis can be run. Ensure the control file `Pmodel_Vespinae.mcmctree.ctl` is configured correctly.

```bash
# In the same directory, execute the MCMCtree script
./start_mcmctree.sh
```

This process will perform the Bayesian divergence time estimation and produce the output files as described in the MCMCtree documentation.

## Citation

If you use the data or methods from this study, please cite our paper:
von Adelmannsfelden et al. 2026, ProcB DOI:XXX
