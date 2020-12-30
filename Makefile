
create:
	kind delete cluster
	kind create cluster --config ./1\ Setup/kind_2_workers.yaml


setup:
	GO111MODULE="on" go get sigs.k8s.io/kind@v0.9.0
	
