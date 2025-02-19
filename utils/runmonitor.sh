#!/bin/bash
docker run -v "$(pwd)/out:/app/out" --name monitorjl --rm  -i monitorjl
