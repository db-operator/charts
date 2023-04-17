# db-operator
DB Operator is Kubernetes operator

## Upgrading to `v1.10.0`
CRDs are moved to the `templates` folder, so now they are part of the release. It means that when migration you will get errors about resource ownership. Thow errors will contain messages about missing `labels` and `annotations`, and the easiest way to fix it, will be just to add the `metadata` that helm can't find. So you can follow those messages one by one and when all the `CRDs` are patched, you'll be able to install the release.

For example:

```BASH
$ helm upgrade my-release .
Error: UPGRADE FAILED: rendered manifests contain a resource that already exists. Unable to continue with update: CustomResourceDefinition "databases.kinda.rocks" in namespace "" exists and cannot be imported into the current release: invalid ownership metadata; label validation error: missing key "app.kubernetes.io/managed-by": must be set to "Helm"; annotation validation error: missing key "meta.helm.sh/release-name": must be set to "my-release"; annotation validation error: missing key "meta.helm.sh/release-namespace": must be set to "default"
```

So you should add following metadata:
```YAML
metadata:
  labels:
    "app.kubernetes.io/managed-by": Helm
  annotations:
    "meta.helm.sh/release-name": my-release
    "meta.helm.sh/release-namespace": default
```

## Installing Chart
To install the chart with the release name my-release:
```
$ helm install --name my-release db-operator/db-operator
```
The command deploys DB Operator on Kubernetes with default configuration. For the configuration options see details [Parameters](#Parameters)

## Uninstalling Chart
To uninstall the `my-release` deployment:
```
$ helm delete my-release
```

## Parameters

The following table lists the configurable parameters of the db-operator chart and their default values.

| Parameter             | Description                           | Default                   |
|-------------------    |-----------------------                |---------------            |
| `appVersion`          | Application Version (DB Operator)     | TODO                      |
| `image.repository`    | Container image name                  | `db-operator/db-operator`  |
| `image.tag`           | Container image tag                   | `latest`                  |
| `image.pullPolicy`    | Container pull policy                 | `Always`                  |
| `imagePullSecrets`    | Reference to secret to be used when pulling images | "" |
| `rbac.create`         | Create RBAC resources                 | `true`                    |
| `serviceAccount.create` | If `true`, create a new service account | `true`                |
| `resources`           | CPU/memory resource requests/limits   | `{}`                      |
| `nodeSelector`        | Node labels for pod assignment        | `{}`                      |
| `affinity`            | Node affinity for pod assignment      | `{}`                      |
| `annotations`         | Annotations to add to the db-operator pod | `{}`                  |
| `podLabels`           | Labels to add to the db-operator pod  | `{}`                      |
| `config.instance.google.proxy.image` | Container image of db-auth-gateway | `ghcr.io/db-operator/db-auth-gateway:v0.1.10` |
| `config.instance.google.proxy.nodeSelector` | Node labels for google cloud proxy pod assignment | `{}` |
| `config.backup.nodeSelector` | Node labels for backup pod assignment | `{}` |
| `config.backup.resources` | Resource configuration for running backup container same as https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#requests-and-limits | `{}` |
| `config.backup.activeDeadlineSeconds` | activeDeadlineSeconds of backup cronjob | `600` |
| `config.backup.postgres.image` | Container image of backup cronjob (only for postgres databases) | `kloeckneri/pgdump-gcs:latest` |
| `config.monitoring.nodeSelector` | Node labels for monitoring pod assignment | `{}` |
| `config.monitoring.postgres.image` | Container image of prometheus exporter (only for postgres databases) | `wrouesnel/postgres_exporter:latest` |
| `config.monitoring.postgres.queries` | Queries executed by prometheus exporter (only for postgres databases) | see `values.yaml` for defaults |
| `secrets.gsql.admin`  |  Service account json used by operator to create Cloud SQL instance in GCE(**Cloud SQL Admin**) | `{}` |
| `secrets.gsql.readonly`   |  Service account json will be used by application to access database Cloud SQL in GCE(**Cloud SQL Client** role) | `{}` |
| `serviceMonitor.enabled`   |  Enabling ServiceMonitor for prometheus operator monitoring | `false` |
