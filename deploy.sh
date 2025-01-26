#!/bin/bash

# author: worthy
# description: pulls latest code from GitHub, rebuilds Docker containers and deploys.

# Set variables for GitHub repository and local folder.
GITHUB_REPO="https://github.com/worthyag/flask_nginx_App.git"
LOCAL_DIR="/Users/worthy/Desktop/SRE/academy/flask_nginx_App"
DOCKER_IMAGE_NAME="worthyag/flask_nginx_app"

# Navigate to the local repository directory.
cd $LOCAL_DIR || exit

# Pull the latest changes from GitHub.
echo "Pulling latest changes from GitHub..."
git pull origin main || exit # Ensure script exits if git pull fails.

# Build the Flask Docker image with the latest code.
echo "Building Flask Docker image..."
docker build -t $DOCKER_IMAGE_NAME:latest . || exit  # Exit if docker build fails.

# Push the updated image to Docker Hub.
echo "Pushing updated Docker image to Docker Hub..."
docker push $DOCKER_IMAGE_NAME:latest || exit  # Exit if docker push fails.

# Stop and remove any running containers.
docker compose down || exit  # Stop and remove containers

# Rebuild and start the containers to ensure the latest code is used.
docker compose up --build -d || exit  # Exit if docker-compose up fails

echo "Deployment Complete!"




# Old code.
# Pull the latest image from Docker Hub
# docker pull worthyag/flask_nginx_app:latest

# Recreate and start containers
# docker-compose down
# docker-compose up -d
