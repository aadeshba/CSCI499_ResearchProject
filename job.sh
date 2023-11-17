#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=16GB
#SBATCH --gpus-per-task=a100:1
#SBATCH --constraint=a100-80gb
#SBATCH --time=8:00:00
#SBATCH --mail-type=fail
#SBATCH --mail-type=end
#SBATCH --mail-user=aadeshba@usc.edu

module purge
module load gcc/11.3.0
module load python/3.9.12
module load cuda/11.6.2
module load cudnn/8.4.0.27-11.6


if [ -d "venv" ]   
then                                                                                     
    echo "Found python virtual environment in working directory. Skipping creation ..."  
else                                                                                     
    echo "Python virtual environment not found. Creating virtual environment ..."        
    python3 -m venv venv                                                                 
fi                                                                                       
source venv/bin/activate

pip3 install --upgrade -r requirements.txt
python3 clean_data.py