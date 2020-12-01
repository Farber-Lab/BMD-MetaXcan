#!/bin/bash
module purge
module load anaconda #gcc openmpi hdf5 gdal grass
source activate PrediXcan

DATA=/scratch/wr8yp/multixcan_mashr_all_tiss/data
METAXCAN=/scratch/wr8yp/multixcan_mashr_all_tiss/data/MetaXcan/software
GWAS_TOOLS=/scratch/wr8yp/multixcan_mashr_all_tiss/data/summary-gwas-imputation/src

python $METAXCAN/SMulTiXcan.py \
--models_folder $DATA/models/eqtl/mashr \
--models_name_pattern "mashr_(.*).db" \
--snp_covariance $DATA/models/gtex_v8_expression_mashr_snp_smultixcan_covariance.txt.gz \
--metaxcan_folder $DATA/bmd_morris/SPrediXcan/eqtl/ \
--metaxcan_filter "bmd_morris_mashr_(.*).csv" \
--metaxcan_file_name_parse_pattern "bmd_morris_mashr_(.*).csv" \
--gwas_file $DATA/bmd_morris/processed_summary_imputation/imputed_bmd_morris.txt.gz \
--snp_column panel_variant_id --effect_allele_column effect_allele --non_effect_allele_column non_effect_allele --zscore_column zscore --keep_non_rsid --model_db_snp_key varID \
--cutoff_condition_number 30 \
--verbosity 7 \
--throw \
--output $DATA/bmd_morris/MultiXcan/eqtl/bmd_morris_8_12_20_multixcan.txt
