## Charts for deploying DB Operator

## Get started with the helm chart

Docs: <https://db-operator.github.io/documentation/install_helm>

Add the repo:

```shell
$ helm repo add db-operator https://db-operator.github.io/charts
$ helm search repo db-operator
```

Install DB Operator:

```shell
$ helm install db-operator/db-operator
# -- Or OCI
$ helm install ghcr.io/db-operator/charts/db-operator:${CHART_VERSION}
```

- More info about the db-operator chart here: [README.md](https://github.com/db-operator/charts/tree/main/charts/db-operator)
- More info about the db-instances chart here: [README.md](https://github.com/db-operator/charts/tree/main/charts/db-instances)

## Development

Docs: <https://db-operator.github.io/documentation/development/helm-charts>

### Pre Commit

It's not required to use **pre-commit hook**, but it will make the development easier. Pre commit hooks against all files are execited during CI.

## Releasing new chart version

The new chart version release is executed automatically with Github actions.
For triggering it, change the version of Chart.yaml in the chart directory and merge to `main` branch.
