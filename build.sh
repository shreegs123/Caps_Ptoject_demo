#!/bin/bash
ImageName= caps-image
docker build -t $ImageName .

docker-compose down || true

docker-compose up -d
