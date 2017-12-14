#!/bin/bash

# unofficial bash strict mode
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

source ./load-env.sh
key="custom-models.json"
echo "deploying your models to $bucket/$key with AWS profile $aws_profile"
eval $s3 --profile "$aws_profile" put-object \
  --bucket "$bucket" \
  --key "$key" \
  --content-type "application/json" \
  --body ./models.json