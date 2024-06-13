#!/bin/bash

# Define the URL
URL="https://hello-world-${OKTETO_NAMESPACE}.${OKTETO_DOMAIN}/"

# Make a GET request to the URL and store the response
RESPONSE=$(curl -s $URL)

# Expected response
EXPECTED="Hello world!"

# Get the current timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Check if the response matches the expected content
if [ "$RESPONSE" == "$EXPECTED" ]; then
    echo "$TIMESTAMP - Test passed: Content is 'hello'"
else
    echo "$TIMESTAMP - Test failed: Content is not 'hello'"
    echo "$TIMESTAMP - Actual content: $RESPONSE"
    exit 1
fi
