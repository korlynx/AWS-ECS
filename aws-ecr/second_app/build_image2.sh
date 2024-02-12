#!/bin/bash

#Before start configure aws CLI
#Get your aws region from configuration
region=$(aws configure get region)
region=${region:-eu-central-1}

# # Get AWS account ID
account_id=$(aws sts get-caller-identity --query Account --output text)

# Set ECR repository name
repo_name="my-app2"
fullname="${account_id}.dkr.ecr.${region}.amazonaws.com"

# # Check if repository is already created in ECR, if not create it.
aws ecr describe-repositories --repository-names "${repo_name}" > /dev/null 2>&1

if [ $? -ne 0 ]
then
    aws ecr create-repository --repository-name ${repo_name} --region ${region}
fi

# # Get login command from ECR and execute it directory
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${fullnamme}

# # # go into the app directory where the docker file is located
# cd first_app/

# Build the docker image locally

docker build -t "${fullname}/${repo_name}:latest" .

# List build image name in docker 
docker images --filter reference="${fullname}/${repo_name}:latest"

# Push image to ECR
docker push "${fullname}/${repo_name}"
