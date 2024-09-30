{{- define "roboshop.replicas1" -}}
{{- if eq .Values.env "dev" }}
{{- printf "%s" .Values.replicas }}
{{- else if eq .Values.env "prod" }}
{{- printf "%s" .Values.replicas }}
{{- else }}
{{- printf "%s" .Values.replicas }}
{{- end }}
{{- end }}

{{- define "roboshop.replicas" -}}
{{- printf "%d" ".Values.replicas" }}
{{- end }}


