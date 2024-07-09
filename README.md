# moneroocean-worker
 
# to build
docker build -t moneroocean-worker:latest .

# to run
docker run --detach --name moneroocean-worker -v xmrig-worker moneroocean-worker:latest

# aoi
docker build -t moneroocean-worker:latest . ; docker run --detach --name moneroocean-worker -v xmrig-worker moneroocean-worker:latest

# test
docker build -t moneroocean-worker:latest . ; docker run -it --rm --name moneroocean-worker -v xmrig-worker moneroocean-worker:latest bash

# not working at this time, need more testing