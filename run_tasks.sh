#!/bin/bash

# Define common parameters
INPUT_DIR="../../../projects_students/vimb02/meta-album"
SUBMISSION_DIR="baselines/protonet"
VERBOSE="False"
OVERWRITE="True"
SEED=100

# Remove old dataset split file
rm -f "$INPUT_DIR/info/meta_splits.txt"

# Copy and rename the new split file
cp "meta_splits_cd.txt" "$INPUT_DIR/info/meta_splits.txt"

# Run experiment with pretrained=True
python -m cdmetadl.run \
    --input_data_dir=$INPUT_DIR \
    --submission_dir=$SUBMISSION_DIR \
    --output_dir_ingestion=ingestion_output_pnP10k \
    --output_dir_scoring=scoring_output_pnP10k \
    --pretrained=True \
    --verbose=$VERBOSE \
    --overwrite_previous_results=$OVERWRITE \
    --seed=$SEED

# Run experiment with pretrained=False
python -m cdmetadl.run \
    --input_data_dir=$INPUT_DIR \
    --submission_dir=$SUBMISSION_DIR \
    --output_dir_ingestion=ingestion_output_pnR10k \
    --output_dir_scoring=scoring_output_pnR10k \
    --pretrained=False \
    --verbose=$VERBOSE \
    --overwrite_previous_results=$OVERWRITE \
    --seed=$SEED
