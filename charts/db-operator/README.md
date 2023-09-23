# db-operator

![Version: 1.9.1](https://img.shields.io/badge/Version-1.9.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.12.0](https://img.shields.io/badge/AppVersion-1.12.0-informational?style=flat-square)

DB Operator is Kubernetes operator
The source of the operator can be found here: https://github.com/db-operator/db-operator

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

## Webhooks

You can disable webhooks if you don't need them, by providing this value
```yaml
webhook:
  create: false
```

## Requirements

Kubernetes: `>= 1.22-prerelease`

If you use webhooks, you also might need to have cert-manager

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| config.backup.activeDeadlineSeconds | int | `600` |  |
| config.backup.mysql.image | string | `"kloeckneri/mydump-gcs:latest"` |  |
| config.backup.nodeSelector | object | `{}` |  |
| config.backup.postgres.image | string | `"kloeckneri/pgdump-gcs:latest"` |  |
| config.backup.resources.requests.cpu | float | `0.2` |  |
| config.backup.resources.requests.memory | string | `"64Mi"` |  |
| config.instance.generic | object | `{}` |  |
| config.instance.google.proxy.image | string | `"ghcr.io/db-operator/db-auth-gateway:v0.1.10"` |  |
| config.instance.google.proxy.metricsPort | int | `9090` |  |
| config.instance.google.proxy.nodeSelector | object | `{}` |  |
| config.instance.percona.proxy.image | string | `"severalnines/proxysql:2.0"` |  |
| config.instance.percona.proxy.metricsPort | int | `9090` |  |
| config.monitoring.nodeSelector | object | `{}` |  |
| config.monitoring.postgres.image | string | `"wrouesnel/postgres_exporter:latest"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[0].userid.description | string | `"User ID"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[0].userid.usage | string | `"LABEL"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[1].dbid.description | string | `"database ID"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[1].dbid.usage | string | `"LABEL"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[2].datname.description | string | `"database NAME"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[2].datname.usage | string | `"LABEL"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[3].queryid.description | string | `"Query unique Hash Code"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[3].queryid.usage | string | `"LABEL"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[4].query.description | string | `"Query class"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[4].query.usage | string | `"LABEL"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[5].calls.description | string | `"Number of times executed"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[5].calls.usage | string | `"COUNTER"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[6].total_time.description | string | `"Total time spent in the statement, in milliseconds"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[6].total_time.usage | string | `"COUNTER"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[7].mean_time.description | string | `"Mean time spent in the statement, in milliseconds"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[7].mean_time.usage | string | `"GAUGE"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[8].rows.description | string | `"Total number of rows retrieved or affected by the statement"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.metrics[8].rows.usage | string | `"COUNTER"` |  |
| config.monitoring.postgres.queries.pg_stat_statements.query | string | `"SELECT userid, pgss.dbid, pgdb.datname, queryid, query, calls, total_time, mean_time, rows FROM pg_stat_statements pgss LEFT JOIN (select oid as dbid, datname from pg_database) as pgdb on pgdb.dbid = pgss.dbid WHERE not queryid isnull ORDER BY mean_time desc limit 20"` |  |
| config.monitoring.promPushGateway | string | `""` |  |
| crds.annotations | object | `{}` |  |
| crds.install | bool | `true` |  |
| crds.keep | bool | `true` |  |
| image.logLevel | string | `"info"` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"ghcr.io/db-operator/db-operator"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podLabels | object | `{}` |  |
| rbac.create | bool | `true` |  |
| reconcileInterval | string | `"60"` |  |
| resources | object | `{}` |  |
| secrets.gsql | object | `{}` |  |
| security | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceMonitor.enabled | bool | `false` |  |
| tolerations | list | `[]` |  |
| watchNamespace | string | `""` |  |
| webhook.certificate.create | bool | `true` | ------------------------------------------ |
| webhook.certificate.issuer.create | bool | `true` |  |
| webhook.certificate.issuer.kind | string | `"Issuer"` | --------------------------------------- |
| webhook.certificate.issuer.name | string | `"db-operator-issuer"` |  |
| webhook.certificate.name | string | `"db-operator-webhook"` |  |
| webhook.certificate.secretName | string | `"db-operator-webhook-cert"` |  |
| webhook.names.mutating | string | `"db-operator-mutating-webhook-configuration"` |  |
| webhook.names.validating | string | `"db-operator-validating-webhook-configuration"` |  |
| webhook.serviceName | string | `"db-operator-webhook"` |  |

## Upgrading

If there is an breaking change, or something that might make the upgrade complicated, it should be described here

<details>
  <summary>To `v1.11.0`</summary>
Additional selectors were added to the default templates in an attempt to follow the same labelling scheme everywhere, but since selectors are immutable, the upgrade will require removing of the db-operator deployment.

```bash
$ kubectl get deploy
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
db-operator   1/1     1            1           22s
$ kubectl delete deploy db-operator
deployment.apps "db-operator" deleted
$ helm upgrade db-operator db-operator/db-operator --version 1.11.0
```

</details>

<details>
  <summary>To `v1.10.0`</summary>

CRDs are moved to the `templates` folder, so now they are part of the release. It means that after the upgrade, you will get errors about resource ownerships. Thow errors will contain messages about missing `labels` and `annotations`, and the easiest way to fix it, will be just to add the `metadata` that helm can't find. So you can follow those messages one by one and when all the `CRDs` are patched, you'll be able to install the release.

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
</details>
