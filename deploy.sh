#!/bin/bash

DOCKER_REPO="rjrrk/prod"
DOCKER_TAG="latest"

echo "Logging in to Docker Hub..."
docker login

LOCAL_IMAGE="react-app-name"

echo "Tagging the Docker image..."
docker tag "${LOCAL_IMAGE}" "$DOCKER_USERNAME/${DOCKER_REPO}:${DOCKER_TAG}"


echo "Pushing the Docker image to Docker Hub..."
docker push "$DOCKER_USERNAME/${DOCKER_REPO}:${DOCKER_TAG}"

echo "Deployment to Docker Hub completed successfully."

docker-compose up -d
