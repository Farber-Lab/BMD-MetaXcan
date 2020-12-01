# Bone Mineral Density SPrediXcan and SMultiXcan 
Morris et al. summary stats from https://www.ebi.ac.uk/gwas/studies/GCST006979

Tutorial using GTEx v8 MASH models 
https://github.com/hakyimlab/MetaXcan/wiki/Tutorial:-GTEx-v8-MASH-models-integration-with-a-Coronary-Artery-Disease-GWAS

### 1.) [subset_gwas.R]
Subsets a full summary stats file to only the needed column for SPrediXcan including effect allele, non-effect allele, chromosome, position, standard error, and effect size. It will output a tab delimited file, which is required for SPrediXcan.

### 2.) harmonization.sh
Formats the GWAS summary statistics for the MetaXcan pipeline including creating a panel_variant_id.

### 3.) imputation.sh
Imputes summary statistics. "Summary statistics imputation works in a "region-wide" approach, each region a conceptual computation unit. Imputation takes all variants from the GTEx reference in a chromosomal region (we use Berisa-Pickrell LD blocks) and impute missing GWAS variants using present GWAS variants and genotypes from GTEx. Our implementation allows to split the imputation of a full GWAS in "sub-batches", i.e. just imputing for a few regions. By splitting the execution in smaller units, we can parallelize in an HPC environment."

### 4.) imp_post.sh
The imputation script splits jobs into smaller units. This script gathers them together and processes them. 

### 5.) SPrediXcan.sh
Runs SPrediXcan on each of the 49 tissues in GTEx v8 using a loop. 49 tissues are listed in tissue_list.txt

### 6.) MultiXcan.sh
Runs MultiXcan using SPrediXcan outputs from each of the 49 tissues. MultiXcan leverages multiple tissues simultaneously, exploiting cross-tissue QTL sharing.





