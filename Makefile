all: lint package

create-secret:
	kubectl create secret generic chainwatch-secret --from-env-file=.env -n chainwatch

install:
	helm upgrade --install chainwatch . 

minikube-install:
	helm upgrade --install -f values.yaml -f values-minikube.yaml chainwatch . 

prod-install:
	helm upgrade --install -f values.yaml -f values-prod.yaml chainwatch . 

uninstall:
	helm uninstall chainwatch

lint:
	helm lint .

package:
	helm package .

dry-run:
	helm upgrade --install --dry-run --debug chainwatch .

minikube-dry-run:
	helm upgrade --install --dry-run --debug -f values.yaml -f values-minikube.yaml chainwatch .

prod-dry-run:
	helm upgrade --install --dry-run --debug -f values.yaml -f values-prod.yaml chainwatch .
