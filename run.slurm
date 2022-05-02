#!/bin/bash -e
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=14
#SBATCH --time=24:00:00
#SBATCH --mem=128GB
#SBATCH --job-name=detr
#SBATCH --output=/scratch/yk1962/dl-final/detr/outputs/bs1-24/slurm_%j.out
#SBATCH --gres=gpu:rtx8000:1
module purge

# Enter required modules
cd /scratch/yk1962/dl-final/detr
source /scratch/yk1962/miniconda3/bin/activate updetr
python main.py --output_dir zoo/bs1-24 --bs 1

