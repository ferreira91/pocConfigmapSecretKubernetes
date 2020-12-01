DEPLOYMENT_NAME ?= poc-configmap-secret
IMAGE ?= poc-configmap-secret
NAMESPACE ?= poc-configmap-secret
REGISTRY ?= localhost:5000
TAG ?= latest

### jib ###
jib-local:
	gradle jib -Djib.to.image=$(REGISTRY)/$(IMAGE):$(TAG) -Djib.allowInsecureRegistries=true

### Kubernetes ###
create-namespace:
	kubectl apply -f k8s/namespace.yaml

create-deployment:
	helm -n $(NAMESPACE) install $(DEPLOYMENT_NAME) k8s/charts/poc-configmap-secret/ --values k8s/charts/poc-configmap-secret/values.yaml

upgrade-deployment:
	helm -n $(NAMESPACE) upgrade $(DEPLOYMENT_NAME) k8s/charts/poc-configmap-secret/ --values k8s/charts/poc-configmap-secret/values.yaml

