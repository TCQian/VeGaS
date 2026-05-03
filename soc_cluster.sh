#!/bin/bash
#SBATCH --job-name=Vegas
#SBATCH --gres=gpu:h100-47:1
#SBATCH --time=12:00:00
#SBATCH --mem=16G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=e0407638@u.nus.edu

RES="480"
DATASET=""

while getopts "p:d:" opt; do
    case $opt in
        p) RES="$OPTARG" ;;
        d) DATASET="$OPTARG" ;;
        *) echo "Usage: sbatch $0 -p <480|1080> -d <dataset_name>"; exit 1 ;;
    esac
done

if [ -z "$DATASET" ]; then
    echo "Error: dataset name required (-d <dataset_name>)"
    exit 1
fi

source ~/.bashrc
conda activate vegas

python train.py \
    -s dataset/DAVIS_processed/${RES}p/$DATASET \
    -m output/DAVIS/${RES}p/$DATASET
