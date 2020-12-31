ifndef $(GOPATH)
  export GOPATH=/go
  ${shell mkdir -p ${GOPATH}}
endif

ifndef $(GOBIN)
  export GOBIN=${GOPATH}/bin
endif


.PHONY: v1.20
v1.20:
	go get k8s.io/kubernetes || true
	cd /go/src/k8s.io/kubernetes && git checkout v1.20.1 || git pull
	go get sigs.k8s.io/kind
#     Node image
	kind build node-image --image=quay.io/mchirico/k8s:v1.20.1







create:
	kind delete cluster
	kind create cluster --image=quay.io/mchirico/k8s:v1.20.1 --config ./1\ Setup/kind_1_worker.yaml

metal:
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	kubectl apply -f metal.yaml



setup:
	GO111MODULE="on" go get sigs.k8s.io/kind@v0.9.0
	
