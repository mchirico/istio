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
k auth can-i --list -A

```