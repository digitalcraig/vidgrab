#!/bin/bash
docker build -f "Dockerfile" -t digitalcraig/vidgrab:latest .
docker push digitalcraig/vidgrab:latest