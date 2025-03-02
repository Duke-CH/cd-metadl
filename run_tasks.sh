#!/bin/bash

# Define common parameters
INPUT_DIR="../../../projects_students/vimb02/meta-album"
SUBMISSION_DIR="baselines/protonet"
VERBOSE="False"
OVERWRITE="True"

# Run experiment with pretrained=True
python -m cdmetadl.run \
    --input_data_dir=$INPUT_DIR \
    --submission_dir=$SUBMISSION_DIR \
    --output_dir_ingestion=ingestion_output_pnP10k \
    --output_dir_scoring=scoring_output_pnP10k \
    --pretrained=True \
    --verbose=$VERBOSE \
    --overwrite_previous_results=$OVERWRITE

# Run experiment with pretrained=False
python -m cdmetadl.run \
    --input_data_dir=$INPUT_DIR \
    --submission_dir=$SUBMISSION_DIR \
    --output_dir_ingestion=ingestion_output_pnR10k \
    --output_dir_scoring=scoring_output_pnR10k \
    --pretrained=False \
    --verbose=$VERBOSE \
    --overwrite_previous_results=$OVERWRITE
