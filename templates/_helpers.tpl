{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "threatstack-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "threatstack-agent.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "threatstack-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return runtime config if docker enabled
*/}}
{{- define "threatstack-agent.docker-config" -}}
{{- if .Values.daemonset.enableDocker -}}
{{- default "container_runtimes.docker.enabled true container_runtimes.docker.kubernetes_enabled true" -}}
{{- end -}}
{{- end -}}

{{/*
Return runtime config if containerd enabled
*/}}
{{- define "threatstack-agent.containerd-config" -}}
{{- if .Values.daemonset.enableContainerd -}}
{{- default "container_runtimes.containerd.enabled true container_runtimes.containerd.kubernetes_enabled true" -}}
{{- end -}}
{{- end -}}
