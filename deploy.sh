#!/bin/bash

# author: worthy
# description: pulls and rebuilds the container.

# Pull the latest image from Docker Hub
docker pull worthyag/flask_nginx_app:latest

# Recreate and start containers
docker-compose down
docker-compose up -d
