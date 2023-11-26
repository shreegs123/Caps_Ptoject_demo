#!/bin/bash

docker build -t capstone-img .

docker-compose down || true

docker-compose up -d
