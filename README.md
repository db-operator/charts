## Charts for deploying DB Operator

## Migration to the db-operator v4

Version `4.0.0` brings new `DbInstances` API. Old API is not removed but is not reconciled by the operator anymore. Since the new version is not backwards compatible with the `v1beta1`, there will be no conversion webhook for it.

The `db-instances` chart, version `3.0.0`, is supposed to deliver the new API for the `DbInstances` without breaking changes. It does not yet introduce all the new features in order to maintain compatibility.

When updating the release, please don't use `server-side` apply, as it introduces issues with the webhook deployment. If not using it is not an option, it should be also possible to remove the validating and mutating db-operator webhooks from the cluster and remove the conversion item from the  `DbInstance` custom resource definition.

## Migration to the db-operator v3

Version `3.0.0` contains breaking changes for ones using the google cloudsql instances. It doesn't mean that the operator will not work with them anymore, but users will have to use **generic** DbInsances and prepare the infrasturture using other tools.

Other changes that might require migration:

- Pod names were changed, now instead of `db-operator-` and `db-operator-webhook`, we have `db-opetator-controller` and `db-operator-webhook`
- RBAC separation: the controller and webhook now use different ClusterRoles. The configuration has been moved to .controller.rbac and .webhook.rbac accordingly.
- DB Operator configuration is now set under `controller.config`

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
