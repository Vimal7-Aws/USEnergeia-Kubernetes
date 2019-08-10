init:
	echo "Start"

deployments:
	#kubectl apply -f go-platform-deployment.yaml
	kubectl apply -f go-state-deployment.yaml

services:
	kubectl apply -f go-stateservice.yaml
	#kubectl apply -f go-platformservice.yaml

	kubectl apply -f istio-gateway.yaml

pods:
	kubectl apply -f busybox.yaml

delete:
	kubectl delete deployment go-state-deployment
	#kubectl delete deployment go-platform-deployment
	kubectl delete service go-stateservice
	#kubectl delete service go-platform-service
	#kubectl delete service istio-ingressgateway
	kubectl delete Gateway go-gateway
	kubectl delete VirtualService go-virtualservice

apply-all: init deployments services pods