init:
	echo "Start"

deployments:
	kubectl apply -f go-platform-deployment.yaml
	kubectl apply -f go-state-deployment.yaml

services:
	kubectl apply -f go-stateservice.yaml
	kubectl apply -f go-platformservice.yaml

pods:
	kubectl apply -f busybox.yaml

apply-all: init deployments services pods