#!/bin/bash

DATA=/project/farber_lab/will/multixcan_mashr_all_tiss/data
METAXCAN=/project/farber_lab/will/multixcan_mashr_all_tiss/data/MetaXcan/software
GWAS_TOOLS=/project/farber_lab/will/multixcan_mashr_all_tiss/data/summary-gwas-imputation/src

python $GWAS_TOOLS/gwas_parsing.py \
-gwas_file $DATA/bmd_morris/bmd_morris_short_clean2.txt \
-liftover $DATA/liftover/hg19ToHg38.over.chain.gz \
-output_column_map SNPID variant_id \
-output_column_map NEA non_effect_allele \
-output_column_map EA effect_allele \
-output_column_map Beta effect_size \
-output_column_map CHR chromosome \
-output_column_map SE standard_error \
-output_column_map BP position \
--insert_value sample_size 228951  \
--chromosome_format \
-output_order variant_id panel_variant_id chromosome position effect_allele non_effect_allele frequency pvalue zscore effect_size standard_error sample_size \
-output $DATA/bmd_morris/harmonized_gwas/harmonized_bmd_morris2.txt
