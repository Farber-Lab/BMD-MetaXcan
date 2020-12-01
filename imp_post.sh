#!/bin/bash
module purge
module load anaconda
source activate PrediXcan

DATA=/scratch/wr8yp/multixcan_mashr_all_tiss/data
METAXCAN=/scratch/wr8yp/multixcan_mashr_all_tiss/data/MetaXcan/software
GWAS_TOOLS=/scratch/wr8yp/multixcan_mashr_all_tiss/data/summary-gwas-imputation/src

python $GWAS_TOOLS/gwas_summary_imputation_postprocess.py \
-gwas_file $DATA/bmd_morris/harmonized_gwas/harmonized_bmd_morris.txt \
-folder $DATA/bmd_morris/summary_imputation \
-pattern bmd_morris_chr* \
-parsimony 7 \
-output $DATA/bmd_morris/processed_summary_imputation/imputed_bmd_morris.txt.gz
