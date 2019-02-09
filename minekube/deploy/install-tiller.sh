#!/bin/bash

# Create namespaces for tiller to manage
NAMESPACES='tiller-world mc-tilla yournshere getityetquestion'
for namespace in $NAMESPACES; do
  kubectl create namespace $namespace
done

# Limit the scope of tiller (move it away from kube-system)
kubectl create -f rbac-config.yml
helm init --tiller-namespace tiller-world --service-account tiller
# Remove the need for '--tiller-namespace' flag in every helm command
echo 'export TILLER_NAMESPACE=tiller-world' >> ~/.bashrc
