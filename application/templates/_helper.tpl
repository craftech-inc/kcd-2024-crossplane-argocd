{{/* Define a template to generate the name of the application */}}
{{- define "s3-awscli-app.name" -}}
{{- default "kcd-crossplane" }}
{{- end }}

{{/* Define a template to generate the name and version of the chart */}}
{{- define "s3-awscli-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end }}

{{/*
Sets the container resources if the user has set any.
*/}}
{{- define "application.resources" -}}
  {{- if .Values.application.resources -}}
          resources:
{{ toYaml .Values.application.resources | indent 12}}
  {{ else }}
          resources:
            requests:
              memory: 256Mi
              cpu: 250m
            limits:
              memory: 256Mi
              cpu: 250m
  {{- end -}}
{{- end -}}