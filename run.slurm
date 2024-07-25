#!/bin/bash
#SBATCH --job-name=offline_ant       # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=32       # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=2G         # memory per cpu-core (4G per cpu-core is default)
#SBATCH --gres=gpu:1             # number of gpus per node
#SBATCH --time=01:15:00          # total run time limit (HH:MM:SS)


module purge
module load anaconda3/2023.3
conda activate contrastive_rl

module load cudatoolkit/11.3 cudnn/cuda-11.x/8.2.0
export LD_LIBRARY_PATH=/usr/local/cudnn/cuda-11.3/8.2.0/lib64:/home/$(whoami)/.conda/envs/contrastive_rl/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/yongweic/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/yongweic/.mujoco/mujoco200/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/yongweic/.mujoco/mujoco200/bin

python lp_contrastive.py
