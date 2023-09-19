{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "db-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "db-operator.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "db-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- printf "%s-sa" (include "db-operator.name" .) -}}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Arguments builder
*/}}
{{- define "db-operator.args" -}}
{{- $args := list -}}
{{- if .Values.checkForChanges -}}
{{- $args = append $args "--check-for-changes" -}}
{{- end -}}
{{ join "," $args }}
{{- end -}}

{{/*
Webhook templates
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "webhook.name" -}}
{{- printf "webhook" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "webhook.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "webhook.serviceAccountName" -}}
{{- if .Values.webhook.serviceAccount.create -}}
{{- printf "%s-sa" (include "webhook.name" .) -}}
{{- else -}}
{{ default "default" .Values.webhook.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "labels" -}}
helm.sh/chart: {{ include "chart" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- if eq (default "helm" .Values.creator) "helm" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
{{- end -}}

{{/*
Image version definition;
*/}}
{{- define "image_version" -}}
{{ default .Chart.AppVersion .Values.image.tag }}
{{- end -}}

{{/*
Image version definition using Github Packages format ('v' prefix);
*/}}
{{- define "github_packages_image_version" -}}
{{- printf "v%s" (default .Chart.AppVersion .Values.image.tag) }}
{{- end -}}
