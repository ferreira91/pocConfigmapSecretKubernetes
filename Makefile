JAR_FILE ?= build/libs/*.jar
TAG ?= v1.0.0
IMAGE ?= poc-configmap-secret
REGISTRY ?= localhost:5000/poc-configmap-secret
NAMESPACE ?= poc-configmap-secret

### Gradle ###
gradle-build:
	./gradlew build

### Docker ###
docker-build: gradle-build
	docker build --build-arg JAR_FILE=$(JAR_FILE) -t $(IMAGE):$(TAG) .

docker-tag:
	docker tag $$(docker images --filter=reference=$(IMAGE) --format "{{.ID}}") $(REGISTRY):$(TAG)

docker-push: docker-tag
	docker push $(REGISTRY):$(TAG)

docker-login:
	docker login --password=$(DOCKER_PASSWORD) --username=$(DOCKER_USERNAME)

### Kubernetes ###
create-namespace:
	kubectl apply -f k8s/namespace.yaml

create-deployment:
	helm -n $(NAMESPACE) install $(IMAGE) k8s/charts/poc-configmap-secret/ --values k8s/charts/poc-configmap-secret/values.yaml

upgrade-deployment:
	helm -n $(NAMESPACE) upgrade $(IMAGE) k8s/charts/poc-configmap-secret/ --values k8s/charts/poc-configmap-secret/values.yaml
