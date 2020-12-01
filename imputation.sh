#!/bin/bash
module purge
module load anaconda
source activate PrediXcan

DATA=/project/farber_lab/will/multixcan_mashr_all_tiss/data
METAXCAN=/project/farber_lab/will/multixcan_mashr_all_tiss/data/MetaXcan/software
GWAS_TOOLS=/project/farber_lab/will/multixcan_mashr_all_tiss/data/summary-gwas-imputation/src

python $GWAS_TOOLS/gwas_summary_imputation.py \
-by_region_file $DATA/eur_ld.bed.gz \
-gwas_file $DATA/bmd_morris/harmonized_gwas/harmonized_bmd_morris.txt \
-parquet_genotype $DATA/reference_panel_1000G/chr${SLURM_ARRAY_TASK_ID}.variants.parquet \
-parquet_genotype_metadata $DATA/reference_panel_1000G/variant_metadata.parquet \
-window 100000 \
-parsimony 7 \
-chromosome ${SLURM_ARRAY_TASK_ID} \
-regularization 0.1 \
-frequency_filter 0.01 \
-sub_batches 0 \
-sub_batch 0 \
--standardise_dosages \
-output $DATA/bmd_morris/summary_imputation/bmd_morris_chr${SLURM_ARRAY_TASK_ID}.txt.gz
