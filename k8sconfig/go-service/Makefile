init:
	echo "Start"

setup:
	gcloud container clusters get-credentials pheonix-cluster --zone us-west1-b --project golden-tenure-231009
	kubectl label namespace default istio-injection=enabled
	gcloud beta container clusters update pheonix-cluster --update-addons=Istio=ENABLED --istio-config=auth=MTLS_PERMISSIVE
	kubectl create clusterrolebinding cluster-admin-binding  --clusterrole=cluster-admin  --user=$(gcloud config get-value core/account)


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

display:
	export INGRESS_HOST="$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')"
	export INGRESS_PORT="$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')"
	export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

apply-all: init deployments services pods