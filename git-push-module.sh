#!/bin/bash

message="$1"

cd "$PWD"/modules/nodebalancer && \
git add . && \
git commit -m "$message" && \
git push origin main


cd "$PWD"/modules/webserver && \
git add . && \
git commit -m "$message" && \
git push origin main


cd "$PWD"/modules/network && \
git add . && \
git commit -m "$message" && \
git push origin main


cd "$PWD"/modules/dbserver && \
git add . && \
git commit -m "$message" && \
git push origin main

