#!/bin/bash

# Print working directory and its contents
echo "Working directory: $(pwd)"
ls -la

# Ensure xmrig-proxy is executable
chmod +x ./xmrig

# Run xmrig-proxy with config
exec ./xmrig --config=config.json
