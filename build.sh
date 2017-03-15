#!/usr/bin/env bash

set -e

echo "Building image..."
docker build -t $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO:$REVISION .
echo "Pushing image"
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO:$REVISION
echo "Updating CFN"
aws cloudformation update-stack --stack-name $STACK_NAME --use-previous-template --capabilities CAPABILITY_IAM \
  --parameters ParameterKey=DockerImageURL,ParameterValue=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO:$REVISION \
  ParameterKey=DesiredCapacity,UsePreviousValue=true \
  ParameterKey=InstanceType,UsePreviousValue=true \
  ParameterKey=MaxSize,UsePreviousValue=true \
  ParameterKey=SubnetIDs,UsePreviousValue=true \
  ParameterKey=VpcId,UsePreviousValue=true
