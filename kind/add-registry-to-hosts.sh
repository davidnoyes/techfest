#!/bin/bash
set -e
# add the registry to /etc/hosts on each node
KIND_CLUSTER_NAME="${KIND_CLUSTER_NAME:-kind}"
reg_name='kind-registry'
ip_fmt='{{.NetworkSettings.IPAddress}}'
cmd="echo $(docker inspect -f "${ip_fmt}" "${reg_name}") registry >> /etc/hosts"
for node in $(kind get nodes --name "${KIND_CLUSTER_NAME}"); do
  docker exec "${node}" sh -c "${cmd}"
done
