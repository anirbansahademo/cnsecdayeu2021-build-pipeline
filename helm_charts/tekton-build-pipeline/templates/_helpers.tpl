{{- define "image_tag.formatted" -}}
{{- printf "%s" .Values.image_tag | replace "." "" | trunc 63 }}
{{- end }}
