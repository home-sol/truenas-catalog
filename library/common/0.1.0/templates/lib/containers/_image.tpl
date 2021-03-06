{{/*
Retrieve image configuration for container
*/}}
{{- define "common.containers.imageConfig" -}}
{{- $values := . -}}
{{- include "common.schema.validateKeys" (dict "values" $values "checkKeys" (list "registry" "repository" "tag" "pullPolicy")) -}}
image: "{{ $values.registry }}/{{ $values.repository }}{{- if hasKey $values "postfix" -}}-{{ $values.postfix }}{{- end -}}:{{ $values.tag }}"
imagePullPolicy: {{ $values.pullPolicy }}
{{- end -}}