#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=ziyadmsq/machine-learning-microservice:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment machine-learning-microservice --image=$dockerpath
# kubectl run prediction-app --image=$dockerpath  --port=5001

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward doployment/machine-learning-microservice 8000:5001
