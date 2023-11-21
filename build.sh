#!/bin/bash

docker build -t caps-image .

docker-compose down || true

docker-compose up -d
