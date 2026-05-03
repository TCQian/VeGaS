#!/bin/bash
#SBATCH --job-name=Vegas
#SBATCH --gres=gpu:h100-47:1
#SBATCH --time=12:00:00
#SBATCH --mem=16G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=e0407638@u.nus.edu

source ~/.bashrc
conda activate vegas

python train.py -s dataset/Beauty -m output/dataset/Beauty
