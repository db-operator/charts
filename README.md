## Prerequisites
* Kubernetes v1.21+
* Helm v3.0.2+

## Releasing new chart version

The new chart version release is executed automatically with Github actions.
For triggering it, change the version of Chart.yaml in the chart directory and merge to `main` branch.

## Configuring helm client
```
$ helm repo add db-operator https://db-operator.github.io/charts
```
Test the helm chart repository
```
$ helm search repo db-operator
```