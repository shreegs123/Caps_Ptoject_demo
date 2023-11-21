#!/bin/bash
# Get the current local branch
gitBranch=$(git rev-parse --abbrev-ref --symbolic-full-name HEAD | tr -d '\n')

# Get the corresponding remote branch
remoteBranch=$(git ls-remote --heads origin | grep "$(git rev-parse HEAD)" | cut -d / -f 3 | tr -d '\n')

# Print the result
echo "$remoteBranch"

# check if the code is pushed to dev branch on git hub then build and push to dockerhub dev repo
if [ $remoteBranch == 'dev' ]; then
	echo "Code pushed to dev branch. Building and pushing Docker image..."

# Build the Docker image
	bash build.sh

# Docker hub login 
	DOCKER_ID= DOCKER_ID
        DOCKER_PASSWORD= DOCKER_PASSWORD
        echo $DOCKER_PASSWORD | docker login -u $DOCKER_ID --password-stdin

# Push the Docker image to development DockerHub repo
	docker push manjushreegs/dev:tagname
	echo "Docker image built and pushed successfully to dev repo."

## check if the code is pushed to dev branch and dev branch is merged to main branch on github then build and push to prod repo on dockerhub.#
elif [ $remoteBranch == 'main' ] && git log -n 1 --merges --pretty=%B | grep -q "Merge branch 'dev'"; then
    echo "Merging dev into main detected. Pushing to prod repository."

# Build the Docker image for production
    bash build.sh

# Docker hub login 
        DOCKER_ID= DOCKER_ID
        DOCKER_PASSWORD= DOCKER_PASSWORD
        echo $DOCKER_PASSWORD | docker login -u $DOCKER_ID --password-stdin

# Push the Docker image to the production repository
    docker push $DOCKER_ID/private-prod:$DOCKER_ID/prod

    echo "Docker image built and pushed successfully to prod repo."
else
    echo "Code pushed to a branch other than dev.. Skipping Docker image build."
fi 


