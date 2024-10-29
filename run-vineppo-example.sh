
# CONFIGSTR="configs/polIter_deepseekSft2_vineppo_MATH.jsonnet"
# APP_DIRECTORY="experiments/vineppo-math"
CONFIGSTR=$1
APP_DIRECTORY=$2

export APP_SEED="2746318213"
# export WANDB_RUN_ID="<unique_wandb_run_id>" # Optional

NUM_GPUS=$(nvidia-smi --query-gpu=name --format=csv,noheader | wc -l)

# Run the training
deepspeed --no_local_rank --num_gpus=$NUM_GPUS  \
         src/treetune/main.py --configs "$CONFIGSTR" \
            run_iteration_loop

# Run the evaluation
deepspeed --no_local_rank --num_gpus=$NUM_GPUS   \
         src/treetune/main.py --configs "$CONFIGSTR" \
            run_evaluation
