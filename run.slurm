#!/bin/bash -e
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=14
#SBATCH --time=23:00:00
#SBATCH --mem=128GB
#SBATCH --job-name=detr
#SBATCH --output=/scratch/yk1962/dl-final/dino/outputs/slurm_%j.out
#SBATCH --gres=gpu:rtx8000:4
module purge

# Enter required modules
cd /scratch/yk1962/dl-final/detr
source /scratch/yk1962/miniconda3/bin/activate updetr
mkdir models
python -m torch.distributed.launch --nproc_per_node=4 main_detr.py --output_dir zoo/distributed

