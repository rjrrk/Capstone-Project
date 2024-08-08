#!/bin/bash

DOCKER_USERNAME="rjrrk"
DOCKER_PASSWORD="Sithara@2020"
DOCKER_REPO="rjrrk/prod"
DOCKER_TAG="latest"

echo "Logging in to Docker Hub..."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-std

LOCAL_IMAGE="react-app-name"

echo "Tagging the Docker image..."
docker tag "${LOCAL_IMAGE}" "$DOCKER_USERNAME/${DOCKER_REPO}:${DOCKER_TAG}"


echo "Pushing the Docker image to Docker Hub..."
docker push "$DOCKER_USERNAME/${DOCKER_REPO}:${DOCKER_TAG}"

echo "Deployment to Docker Hub completed successfully."
docker compose down || true
docker compose up -d
