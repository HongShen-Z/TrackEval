#!/bin/bash
#BSUB -J track
#BSUB -o %J.out
#BSUB -e %J.err
#BSUB -q gpu_v100
#BSUB -gpu "num=1:mode=exclusive_process:aff=yes"

module load anaconda3
source activate
conda deactivate
conda activate fair
python run_mot_challenge.py --TRACKERS_TO_EVAL 'MOT20_ch_gd0.5' --BENCHMARK 'MOT20' \
--METRICS ['HOTA', 'CLEAR', 'Identity'] --SKIP_SPLIT_FOL True \
--TRACKERS_FOLDER '/seu_share/home/dijunyong/220205723/projects/FairMOT/demos' \
--GT_FOLDER '/seu_share/home/dijunyong/220205723/datasets/MOT/data/gt/mot_challenge/'
