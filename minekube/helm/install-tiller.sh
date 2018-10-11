#!/bin/bash

kubectl create -f rbac-config.yml
helm init --tiller-namespace tiller-world --service-account tiller
echo 'export TILLER_NAMESPACE=tiller-world' >> ~/.bashrc
