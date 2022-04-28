#!/bin/bash

command="$1"

echo "-- nodebalancer:" && \
cd ~/workspace/terraform-linode-base-project/modules/nodebalancer && \
eval "${command}" && \
echo

echo "-- network:" && \
cd ~/workspace/terraform-linode-base-project/modules/network && \
eval "${command}" && \
echo

echo "-- webserver:" && \
cd ~/workspace/terraform-linode-base-project/modules/webserver && \
eval "${command}" && \
echo

echo "-- dbserver:" && \
cd ~/workspace/terraform-linode-base-project/modules/dbserver && \
eval "${command}" && \
echo
