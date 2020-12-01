#!/bin/bash
module purge
module load anaconda #gcc openmpi hdf5 gdal grass
source activate PrediXcan

DATA=/project/farber_lab/will/multixcan_mashr_all_tiss/data
METAXCAN=/project/farber_lab/will/multixcan_mashr_all_tiss/data/MetaXcan/software
GWAS_TOOLS=/project/farber_lab/will/multixcan_mashr_all_tiss/data/summary-gwas-imputation/src

#TISS=('Adipose_Subcutaneous', 'Adipose_Visceral_Omentum')
mapfile -t myArray < $DATA/models/eqtl/mashr/tissue_list.txt

for i in "${myArray[@]}"; do

python $METAXCAN/MetaXcan.py \
--gwas_file  $DATA/bmd_morris/processed_summary_imputation/imputed_bmd_morris.txt.gz \
--snp_column panel_variant_id --effect_allele_column effect_allele --non_effect_allele_column non_effect_allele --zscore_column zscore \
--model_db_path $DATA/models/eqtl/mashr/${i}.db \
--covariance $DATA/models/eqtl/mashr/${i}.txt.gz \
--keep_non_rsid --additional_output --model_db_snp_key varID \
--throw \
--output_file $DATA/bmd_morris/SPrediXcan/eqtl/bmd_morris_${i}.csv
 
done
