This project aims to automate the creation and deployment of an internal docker registry.
Currently, an insecure docker registry is created with persistent storage and no authentication.
In the future, an emulation of openshift's docker registry is desired. TLS will probably be the first step in this direction

This registry is intended to be deployed in the 'registry' namespace. Ideally, a
single registry will be able to pull images from multiple private registries and
serve them to the cluster

Assuming a namespace of 'registry' and a service 'distribution', all pods should be able to refer 'distribution.registry' as a valid dns address.

output of 'curl http://distribution.registry:5000/v2/_catalog' should be '{"repositories":[]}' initially 
