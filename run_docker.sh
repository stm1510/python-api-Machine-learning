#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t tawfiq15/python3-app .
# Step 2: 
# List docker images
docker images ls 

# Step 3: 
# Run flask app
docker run -itd -p 8000:80 tawfiq15/python3-app
