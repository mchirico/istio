# Common Commands

```bash
kubectl -n istio-system get deploy
```

NAME                   READY   UP-TO-DATE   AVAILABLE   AGE
grafana                1/1     1            1           5h37m
istio-egressgateway    1/1     1            1           5h56m
istio-ingressgateway   1/1     1            1           5h56m
istiod                 1/1     1            1           5h56m
jaeger                 1/1     1            1           5h37m
kiali                  1/1     1            1           5h37m
prometheus             1/1     1            1           5h37m

For a detail of what's installed

```bash
kubectl -n istio-system get IstioOperator installed-state -o yaml

```

# Access to resources

```bash
k auth can-i --list 

# You can also create
k create ns dayz
kubens dayz
k create sa zoe
k create rolebinding zoe --clusterrole=admin --serviceaccount=dayz:zoe

k auth can-i --list --as=system:serviceaccount:dayz:zoe -n dayz

# Compare this to kube-system

k auth can-i --list --as=system:serviceaccount:dayz:zoe -n kube-system

# Or better way

k auth can-i create deployments --as zoe
k auth can-i delete nodes --as zoe
k auth can-i create pods --as zoe


# Other things you can do

k get rolebindings

```

`k get rolebindings`

NAME   ROLE                AGE
zoe    ClusterRole/admin   29m



# Delete namespace

```bash
(
NAMESPACE=yellow
kubectl proxy &
kubectl get namespace $NAMESPACE -o json |jq '.spec = {"finalizers":[]}' >temp.json
curl -k -H "Content-Type: application/json" -X PUT --data-binary @temp.json 127.0.0.1:8001/api/v1/namespaces/$NAMESPACE/finalize
)

```