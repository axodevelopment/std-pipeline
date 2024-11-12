#!/bin/bash

# Get the route URL
ROUTE_URL=$(oc get route el-github-mock-listener -o jsonpath='{.spec.host}')

# Check if route exists
if [ -z "$ROUTE_URL" ]; then
    echo "Error: Route not found"
    exit 1
fi

echo "Using Route URL: $ROUTE_URL"

# Construct the JSON payload
JSON_DATA='{"message": "Hello from curl!", "repository": {"name": "fake-repo"}}'

# Send the request
echo "Sending request..."
curl -v \
    -H 'Content-Type: application/json' \
    -d "$JSON_DATA" \
    http://$ROUTE_URL

# Check curl exit status
if [ $? -eq 0 ]; then
    echo -e "\nRequest sent successfully"
else
    echo -e "\nError sending request"
    exit 1
fi

# Optionally watch for PipelineRun creation
echo -e "\nWatching for PipelineRun..."
oc get pipelinerun --watch &
WATCH_PID=$!

# Wait for a few seconds to see the PipelineRun
sleep 5

# Kill the watch process
kill $WATCH_PID 2>/dev/null
