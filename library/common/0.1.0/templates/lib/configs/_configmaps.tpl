
{{/*
Retrieve deployment metadata
*/}}
{{- define "common.configmap.metadata" -}}
metadata:
  name: {{ template "common.names.fullname" . }}
  labels: {{ include "common.labels" . | nindent 4 }}
{{- end -}}
{{/*
Retrieve common configmap configuration
*/}}
{{- define "common.configmap.common_config" -}}
apiVersion: v1
kind: ConfigMap
{{ include "common.configmap.metadata" . | nindent 0 }}
{{- end -}}