#!/bin/bash
# Get the current local branch
gitBranch=$(git rev-parse --abbrev-ref --symbolic-full-name HEAD | tr -d '\n')

# Get the corresponding remote branch
remoteBranch=$(git ls-remote --heads origin | grep "$(git rev-parse HEAD)" | cut -d / -f 3 | tr -d '\n')

# Print the result
echo "$remoteBranch"
# echo "Git Branch: origin/$remoteBranch"


if [ $remoteBranch == 'dev' ]; then
    echo "Code pushed to dev branch. Building and pushing Docker image..."
    
 // Log in to DockerHub without requiring TTY
    echo ${DOCKERHUB_PASSWORD} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin


    # Build the Docker image
    docker build -t "${DOCKER_USERNAME}/dev-image:latest" .

    # Push the Docker image to DockerHub
    docker push "${DOCKER_USERNAME}/dev-image:latest"

    echo "Docker image built and pushed successfully."
else
    echo "Code pushed to a branch other than dev. Skipping Docker image build."
fi 


