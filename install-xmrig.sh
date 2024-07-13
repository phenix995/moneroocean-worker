#!/bin/bash

# Define variables
XMRIG_DIR=~/xmrigDir
GIT_REPO="https://github.com/phenix995/moneroocean-worker.git"
TMUX_SESSION_NAME=xmrig
XMRIG_URL="https://github.com/MoneroOcean/xmrig/releases/download/v6.21.3-mo15/xmrig-v6.21.3-mo15-lin64.tar.gz"

# Create the xmrig directory if it doesn't exist
mkdir -p $XMRIG_DIR

# Clone the GitHub repository
git clone $GIT_REPO xmrigRepo

# Download and extract xmrig
wget -O xmrigOcean.tar.gz $XMRIG_URL
if file xmrigOcean.tar.gz | grep -q 'gzip compressed data'; then
    tar -xvf xmrigOcean.tar.gz
    #rm xmrigOcean.tar.gz
else
    echo "Downloaded file is not a valid gzip file."
    exit 1
fi

mv xmrig $XMRIG_DIR
rm config.json
cp xmrigRepo/config.json $XMRIG_DIR

rm -r xmrigRepo xmrigOcean.tar.gz

# Ensure xmrig is executable
chmod +x $XMRIG_DIR/xmrig

# Create a new tmux session and run xmrig
tmux new-session -d -s $TMUX_SESSION_NAME "$XMRIG_DIR/xmrig --config=$XMRIG_DIR/config.json"

# Output the status
echo "xmrig is now running in a tmux session named $TMUX_SESSION_NAME."
echo "Use 'tmux attach-session -t $TMUX_SESSION_NAME' to view the session."
echo "Use 'tmux detach' (Ctrl+b, then d) to detach from the session."
echo "Use 'tmux kill-session -t $TMUX_SESSION_NAME' to stop the session."
