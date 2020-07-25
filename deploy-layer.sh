#!/bin/bash
set -eo pipefail

ARTIFACT_BUCKET=$(cat bucket_name.txt)
LAYER_ZIP=lambda_data_science_layer_python38.zip 

# First upload the zip to S3 due to size >50 MB
aws s3 cp $LAYER_ZIP s3://$ARTIFACT_BUCKET

# Then publish layer to Lambda
aws lambda publish-layer-version \
  --layer-name lambda-data-science-layer-python38 \
  --content S3Bucket=$ARTIFACT_BUCKET,S3Key=$LAYER_ZIP \
  --region us-east-1 \
  --compatible-runtimes python3.8
