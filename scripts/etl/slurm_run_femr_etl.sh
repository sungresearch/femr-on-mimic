#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lawrence.guo@sickkids.ca
#SBATCH --time=3-00:00 # Runtime in D-HH:MM
#SBATCH --job-name=etl_m-f
#SBATCH --nodes=1
#SBATCH -n 24 #number of cores to reserve, default is 1
#SBATCH --mem=64000 # in MegaBytes. default is 8 GB
#SBATCH --constraint="AlmaLinux8"
#SBATCH --error=/hpf/projects/lsung/phi/projects/lguo/femr-on-mimic/logs/pipeline/error-sbatchjob.%J.err
#SBATCH --output=/hpf/projects/lsung/phi/projects/lguo/femr-on-mimic/logs/pipeline/out-sbatchjob.%J.out

source activate /hpf/projects/lsung/envs/lguo/femr-on-mimic

etl_mimic_omop /hpf/projects/lsung/phi/data/mimic_omop_csv/ /hpf/projects/lsung/phi/data/femr_mimic_extract /hpf/projects/lsung/phi/data/femr_mimic_extract_temp --num_threads 8
