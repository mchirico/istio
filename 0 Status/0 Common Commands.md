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

# Other things you can do

k get rolebindings

```

`k get rolebindings`

NAME   ROLE                AGE
zoe    ClusterRole/admin   29m

