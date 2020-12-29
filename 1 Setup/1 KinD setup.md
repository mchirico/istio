## Install KinD

```bash
GO111MODULE="on" go get sigs.k8s.io/kind@v0.9.0

```

## 

```bash
sudo mkdir -p /pod-50g
chown codespace.codepace /pod-50g
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

