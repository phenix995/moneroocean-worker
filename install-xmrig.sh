#!/bin/bash

# Define variables
XMRIG_DIR=~/xmrig
GIT_REPO="https://github.com/phenix995/moneroocean-worker.git"
TMUX_SESSION_NAME=xmrig
XMRIG_VERSION="v6.15.3"  # Change this to the desired version

# Create the xmrig directory if it doesn't exist
mkdir -p $XMRIG_DIR

# Clone the GitHub repository
git clone $GIT_REPO $XMRIG_DIR

# Ensure tmux is installed
sudo apt update
sudo apt install -y tmux git

# Navigate to the xmrig directory
cd $XMRIG_DIR

# Download and extract xmrig
curl -L -o xmrig.tar.gz "https://github.com/xmrig/xmrig/releases/download/$XMRIG_VERSION/xmrig-$XMRIG_VERSION-linux-x64.tar.gz"
tar -xvf xmrig.tar.gz --strip 1
rm xmrig.tar.gz

# Ensure xmrig is executable
chmod +x xmrig

# Ensure the entrypoint script is executable
chmod +x entrypoint.sh

# Create a new tmux session and run xmrig
tmux new-session -d -s $TMUX_SESSION_NAME './entrypoint.sh'

# Output the status
echo "xmrig is now running in a tmux session named $TMUX_SESSION_NAME."
echo "Use 'tmux attach-session -t $TMUX_SESSION_NAME' to view the session."
echo "Use 'tmux detach' (Ctrl+b, then d) to detach from the session."
echo "Use 'tmux kill-session -t $TMUX_SESSION_NAME' to stop the session."
