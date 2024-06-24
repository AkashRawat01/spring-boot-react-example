{{/*
Generate a fullname from the release name.
*/}}
{{- define "java-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Generate a name for the service account.
*/}}
{{- define "java-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "java-chart.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- "default" -}}
{{- end -}}
{{- end }}