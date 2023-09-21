#!/bin/bash
#SBATCH --time=1-00:00 # Runtime in D-HH:MM
#SBATCH --job-name=etl
#SBATCH --nodes=1
#SBATCH -n 24
#SBATCH --mem=128000
#SBATCH --constraint="AlmaLinux8"

source activate /hpf/projects/lsung/envs/lguo/femr

PATH_SOURCE="/hpf/projects/lsung/data/omop_20230301_validated_csv"
PATH_DESTINATION="/hpf/projects/lsung/data/femr_extract"
PATH_TEMP="/hpf/projects/lsung/data/femr_extract_temp"

etl_sickkids_omop \
    $PATH_SOURCE \
    $PATH_DESTINATION \
    $PATH_TEMP \
    --num_threads=12
