# db-operator

![Version: 3.11.0](https://img.shields.io/badge/Version-3.11.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.35.0](https://img.shields.io/badge/AppVersion-2.35.0-informational?style=flat-square)

This operator lets you manage databases in a Kubernetes native way, even if they are not deployed to Kubernetes

**Homepage:** <https://github.com/db-operator>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Nikolai Rodionov | <iam@allanger.xyz> | <https://badhouseplants.net> |

## Source Code

* <https://github.com/db-operator/db-operator>

## Requirements

Kubernetes: `>= 1.32-prerelease`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| clusterDomain | string | `"cluster.local"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"db-operator/db-operator-dev"` |  |
| image.tag | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| metadata.labels | object | `{}` |  |
| metadata.annotations | object | `{}` |  |
| crds.install | bool | `true` |  |
| crds.keep | bool | `true` |  |
| crds.annotations | object | `{}` |  |
| controller.logLevel | string | `"info"` |  |
| controller.extraArgs | list | `[]` |  |
| controller.service.annotations | object | `{}` |  |
| controller.service.type | string | `"ClusterIP"` |  |
| controller.service.port | int | `8080` |  |
| controller.serviceAccount.name | string | `""` |  |
| controller.serviceAccount.create | bool | `true` |  |
| controller.rbac.create | bool | `true` |  |
| controller.config.backup.activeDeadlineSeconds | int | `600` |  |
| controller.config.backup.nodeSelector | object | `{}` |  |
| controller.config.backup.postgres.image | string | `"ghcr.io/db-operator/pgdump-rclone:0.1.1"` |  |
| controller.config.backup.mysql.image | string | `"ghcr.io/db-operator/mydump-rclone:0.1.1"` |  |
| controller.config.backup.resources.requests.memory | string | `"64Mi"` |  |
| controller.config.backup.resources.requests.cpu | float | `0.2` |  |
| controller.config.monitoring.promPushGateway | string | `""` |  |
| controller.args.reconcileInterval | string | `"60"` |  |
| controller.args.watchNamespace | string | `""` |  |
| controller.args.checkForChanges | bool | `false` |  |
| controller.serviceMonitor.enabled | bool | `false` |  |
| webhook.enabled | bool | `true` |  |
| webhook.logLevel | string | `"info"` |  |
| webhook.extraArgs | list | `[]` |  |
| webhook.podLabels | object | `{}` |  |
| webhook.rbac.create | bool | `true` |  |
| webhook.serviceAccount.name | string | `""` |  |
| webhook.serviceAccount.create | bool | `true` |  |
| webhook.service.ipFamilyPolicy | string | `""` |  |
| webhook.names.mutating | string | `"db-operator-mutating-webhook-configuration"` |  |
| webhook.names.validating | string | `"db-operator-validating-webhook-configuration"` |  |
| webhook.certificate.create | bool | `true` | ------------------------------------------ |
| webhook.certificate.name | string | `"db-operator-webhook"` |  |
| webhook.certificate.secretName | string | `"db-operator-webhook-cert"` |  |
| webhook.certificate.issuer.create | bool | `true` |  |
| webhook.certificate.issuer.name | string | `"db-operator-issuer"` |  |
| webhook.certificate.issuer.kind | string | `"Issuer"` | --------------------------------------- |
| podSecurityContext | object | `{"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Configure the security context for the operator pods |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}}` | Configure the security context for the operator container |
| hostUsers | bool | `true` |  |
| resources | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| annotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| affinity | object | `{}` |  |
| tolerations | list | `[]` |  |
| secrets.gsql | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |

