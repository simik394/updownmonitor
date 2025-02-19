#!/bin/bash
docker run -v "$(pwd)/out:/app/out" --name monitorjl --rm -d -i monitorjl
