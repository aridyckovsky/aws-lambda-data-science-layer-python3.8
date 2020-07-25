#!/bin/bash
set -eo pipefail

BUCKET_REGION=us-east-1
BUCKET_FILE=bucket_name.txt

if [ -f $BUCKET_FILE ] && [ ! -z $(cat $BUCKET_FILE) ]; then
  # exit if bucket with name already exists
  echo "Bucket with this name already exists."
  exit
fi

BUCKET_ID=$(dd if=/dev/random bs=8 count=1 2>/dev/null | od -An -tx1 | tr -d ' \t\n')
BUCKET_NAME=lambda-artifacts-$BUCKET_ID

# save bucket name
echo $BUCKET_NAME > bucket_name.txt

# create new bucket
aws s3 mb s3://$BUCKET_NAME \
  --region $BUCKET_REGION
