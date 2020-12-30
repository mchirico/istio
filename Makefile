
create:
	kind delete cluster
	kind create cluster --config ./1\ Setup/kind_2_workers.yaml

metal:
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	k apply -f metal.yaml



setup:
	GO111MODULE="on" go get sigs.k8s.io/kind@v0.9.0
	
