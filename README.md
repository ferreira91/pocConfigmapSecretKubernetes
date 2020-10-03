# pocConfigmapSecretsKubernetes

Using path `root`  
Run `./kind.sh` to create cluster and registry local `kind`  
Run `make docker-build` to build image docker  
Run `make docker-push` to push image in kind registry (local)  
Run `make create-namespace` to create namespace `test`  
Run `make create-deployment` to create deployment of pocConfigMapSecrets in cluster  
Run `make upgrade-deployment` to upgrade deployment of pocConfigMapSecrets in cluster  
Run `make create-configmap` to create `configmap` in cluster

