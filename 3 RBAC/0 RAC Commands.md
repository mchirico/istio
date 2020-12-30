# Create

```bash
k -n red create role secret-manager --verb=get --verb=create --resource=secrets -oyaml --dry-run=client

k -n red create rolebinding secret-manager --role=secret-manager --user=jane -oyaml --dry-run

```
