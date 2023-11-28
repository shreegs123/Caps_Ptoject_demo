#!/bin/bash
# Get the current local branch
gitBranch=$(git rev-parse --abbrev-ref --symbolic-full-name HEAD | tr -d '\n')

# Get the corresponding remote branch
remoteBranch=$(git ls-remote --heads origin | grep "$(git rev-parse HEAD)" | cut -d / -f 3 | tr -d '\n')

# Print the result
echo "$remoteBranch"

# check if the code is pushed to dev branch on git hub then build and push to dockerhub dev repo
<<<<<<< HEAD
if [ "$remoteBranch" = "dev" ]; then
=======
if [ "$remoteBranch" = 'dev' ]; then
>>>>>>> 622a71c5094e1785b99d74ad82ca82db8bfa480b
	echo "Code pushed to dev branch. Building and pushing Docker image..."

# Docker hub login 
	DOCKER_ID= DOCKER_ID
        DOCKER_PASSWORD= DOCKER_PASSWORD
        echo $DOCKER_PASSWORD | docker login -u $DOCKER_ID --password-stdin

# Build the Docker image
        bash build.sh
        docker tag capstone-image:latest $DOCKER_ID/dev:React-App

# Push the Docker image to development DockerHub repo
	docker push $DOCKER_ID/dev:React-App
	echo "Docker image built and pushed successfully to dev repo."

## check if the code is pushed to dev branch and dev branch is merged to main branch on github then build and push to prod repo on dockerhub.#
<<<<<<< HEAD
elif [ "$remoteBranch" = "main" ] && git log -n 1 --merges --pretty=%B | grep -q "Merge branch 'dev'"; then
    echo "Merging dev into main detected. Pushing to prod repository."

# Build the Docker image for production
    bash build.sh

# Docker hub login 
        DOCKER_ID= DOCKER_ID
        DOCKER_PASSWORD= DOCKER_PASSWORD
        echo $DOCKER_PASSWORD | docker login -u $DOCKER_ID --password-stdin

# Push the Docker image to the production repository
    docker tag capstone-image:latest $DOCKER_ID/prod:React-App
    docker push $DOCKER_ID/private-prod:React-App

    echo "Docker image built and pushed successfully to prod repo."
else
    echo "Code pushed to a branch other than dev.. Skipping Docker image build."
fi 


