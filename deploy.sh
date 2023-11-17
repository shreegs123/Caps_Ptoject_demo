#!/bin/bash

# Path to your local repository
REPO_PATH="/path/to/your/repository"

# DockerHub credentials
DOCKERHUB_USERNAME="your_dockerhub_username"
DOCKERHUB_PASSWORD="your_dockerhub_password"

# Check if the branch is dev
if [ "$GITHUB_REF" == "refs/heads/dev" ]; then
    echo "Code pushed to dev branch. Building and pushing Docker image..."

    # Navigate to the repository directory
    cd "$REPO_PATH" || exit

    # Build the Docker image
    docker build -t "${DOCKERHUB_USERNAME}/dev-image:latest" .

    # Log in to DockerHub
    echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

    # Push the Docker image to DockerHub
    docker push "${DOCKERHUB_USERNAME}/dev-image:latest"

    echo "Docker image built and pushed successfully."
else
    echo "Code pushed to a branch other than dev. Skipping Docker image build."
fi

