# NextCloud in Kubernetes with all the fixins
Choose either the all-in-one or modular folders 

all-in-one has a Deployment, Service, and PVC. Users are expected to select the
sqlite database and create a password on the initial run.
modular has a Deployment, Service and PVC for the web component of NextCloud and
a StatefulSet, Service, and PVC for the database component. Users are expected
to create a password on the initial run.

Administration via the shell of the nextcloud container is not currently
possible due to the user explicitly needing to be www-data to run the
administrative binary.
