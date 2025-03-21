#!/bin/bash

docker build -t kmc:dev -f ./Dockerfile-alpine --progress=plain . && \

docker run -it --rm \
  --name kmc-dev \
  -p 3080:3080 \
  -p 3443:3443 \
  -p 5000:5000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes:ro \
  -v kmc_dev_data:/app/data \
  -e AGENT_DATA_VOLUME=kmc_dev_data \
  kmc:dev $@
