JAR_FILE ?= build/libs/*.jar
TAG ?= v1.0.0
IMAGE ?= poc-configmap-secrets
REGISTRY ?= localhost:5000/poc-configmap-secrets

build-install:
	./gradlew build

generate-image: build-install
	docker build --build-arg JAR_FILE=$(JAR_FILE) -t $(IMAGE):$(TAG) .

docker-tag:
	docker tag $$(docker images --filter=reference=$(IMAGE) --format "{{.ID}}") $(REGISTRY):$(TAG)

docker-push: docker-tag
	docker push $(REGISTRY):$(TAG)

docker-login:
	docker login --password=$(DOCKER_PASSWORD) --username=$(DOCKER_USERNAME)
