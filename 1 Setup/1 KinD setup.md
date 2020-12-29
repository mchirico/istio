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
kind create cluster --config ./1\ Setup/kind_2_workers.yaml

```

## Check that everything is working

```bash
docker ps --format "table{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}"

```

