#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=tawfiq15/python3-app

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy python-app --image=tawfiq15/python3-app

# Step 3:
# List kubernetes pods
kubectl get pods 
# Step 4:
# Forward the container port to a host
kubectl port-forward pod/*** --address 0.0.0.0 80:80
