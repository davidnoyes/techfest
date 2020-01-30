.PHONY: build
build: kind-create k8s

.PHONY: kind-create
kind-create:
	@kind create cluster --config kind/kind-config.yaml
	@./kind/add-registry-to-hosts.sh

.PHONY: kind-delete
kind-delete:
	@kind delete cluster

.PHONY: k8s
k8s:
	@kubectl apply -R -f k8s


.DEFAULT_GOAL := build
