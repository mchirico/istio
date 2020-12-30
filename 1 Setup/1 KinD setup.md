## Install KinD

```bash
GO111MODULE="on" go get sigs.k8s.io/kind


```

## 

```bash
sudo mkdir -p /pod-50g
sudo chown codespace.codespace /pod-50g

```


## Start the cluster

```bash
kind delete cluster
kind create cluster --config ./1\ Setup/kind_2_workers.yaml

```

## Check that everything is working

```bash
docker ps --format "table{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"

```

## istio
```bash
cd ~/dotfiles
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.8.1


istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled
```

## deploy sample
```bash


cd ~/dotfiles
cd istio-1.8.1
kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml

```

## Metal

```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

```


## Octant

```bash
wget https://github.com/vmware-tanzu/octant/releases/download/v0.16.3/octant_0.16.3_Linux-64bit.tar.gz

```


# istio environment
```bash

export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export TCP_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tcp")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
```