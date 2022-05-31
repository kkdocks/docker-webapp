#!/usr/bin/env bash

docker build -t nekoimi/webapp:latest .

docker push nekoimi/webapp:latest
