#!/bin/bash

docker build -t caps-img .

docker-compose down || true

docker-compose up -d
