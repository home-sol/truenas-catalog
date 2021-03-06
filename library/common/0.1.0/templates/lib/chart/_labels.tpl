{{/*
Common labels shared across objects.
*/}}
{{- define "common.labels" -}}
helm.sh/chart: {{ include "common.names.chart" . }}
{{ include "common.labels.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels shared across objects.
*/}}
{{- define "common.labels.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
app.kubernetes.io/instance: {{ include "common.names.releaseName" . }}
{{ if hasKey .Values "extraSelectorLabels" }}
{{ range $selector := .Values.extraSelectorLabels }}
{{ printf "%s: %s" $selector.key $selector.value }}
{{ end }}
{{ end }}
{{- end }}