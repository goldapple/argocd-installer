function (
  is_offline="false",
  private_registry="registry.tmaxcloud.org",
  ISTIO_VERSION= "1.5.1",
)

local target_registry = if is_offline == "false" then "" else private_registry + "/";

[
  {
    "apiVersion": "v1",
    "kind": "ConfigMap",
    "metadata": {
      "name": "istio-sidecar-injector",
      "namespace": "istio-system",
      "labels": {
        "release": "istio"
      }
    },
    "data": {
      "values": std.join("\n",
        [
          "{",
          "  \"global\": {",
          "    \"arch\": {",
          "      \"amd64\": 2,",
          "      \"ppc64le\": 2,",
          "      \"s390x\": 2",
          "    },",
          "    \"certificates\": [],",
          "    \"configNamespace\": \"istio-system\",",
          "    \"configValidation\": true,",
          "    \"controlPlaneSecurityEnabled\": true,",
          "    \"defaultNodeSelector\": {},",
          "    \"defaultPodDisruptionBudget\": {",
          "      \"enabled\": true",
          "    },",
          "    \"defaultResources\": {",
          "      \"requests\": {",
          "        \"cpu\": \"10m\"",
          "      }",
          "    },",
          "    \"disablePolicyChecks\": true,",
          "    \"enableHelmTest\": false,",
          "    \"enableTracing\": true,",
          "    \"enabled\": true,",
          std.join("", ["    \"hub\": ", target_registry, "docker.io/istio,"]),
          "    \"imagePullPolicy\": \"IfNotPresent\",",
          "    \"imagePullSecrets\": [],",
          "    \"istioNamespace\": \"istio-system\",",
          "    \"istiod\": {",
          "      \"enabled\": true",
          "    },",
          "    \"jwtPolicy\": \"first-party-jwt\",",
          "    \"k8sIngress\": {",
          "      \"enableHttps\": false,",
          "      \"enabled\": false,",
          "      \"gatewayName\": \"ingressgateway\"",
          "    },",
          "    \"localityLbSetting\": {",
          "      \"enabled\": true",
          "    },",
          "    \"logAsJson\": false,",
          "    \"logging\": {",
          "      \"level\": \"default:info\"",
          "    },",
          "    \"meshExpansion\": {",
          "      \"enabled\": false,",
          "      \"useILB\": false",
          "    },",
          "    \"meshNetworks\": {},",
          "    \"mountMtlsCerts\": false,",
          "    \"mtls\": {",
          "      \"auto\": true,",
          "      \"enabled\": false",
          "    },",
          "    \"multiCluster\": {",
          "      \"clusterName\": \"\",",
          "      \"enabled\": false",
          "    },",
          "    \"namespace\": \"istio-system\",",
          "    \"network\": \"\",",
          "    \"omitSidecarInjectorConfigMap\": false,",
          "    \"oneNamespace\": false,",
          "    \"operatorManageWebhooks\": false,",
          "    \"outboundTrafficPolicy\": {",
          "      \"mode\": \"ALLOW_ANY\"",
          "    },",
          "    \"pilotCertProvider\": \"istiod\",",
          "    \"policyCheckFailOpen\": false,",
          "    \"policyNamespace\": \"istio-system\",",
          "    \"priorityClassName\": \"\",",
          "    \"prometheusNamespace\": \"istio-system\",",
          "    \"proxy\": {",
          "      \"accessLogEncoding\": \"JSON\",",
          "      \"accessLogFile\": \"\",",
          "      \"accessLogFormat\": \"\",",
          "      \"autoInject\": \"enabled\",",
          "      \"clusterDomain\": \"cluster.local\",",
          "      \"componentLogLevel\": \"misc:error\",",
          "      \"concurrency\": 2,",
          "      \"dnsRefreshRate\": \"300s\",",
          "      \"enableCoreDump\": false,",
          "      \"envoyAccessLogService\": {",
          "        \"enabled\": false",
          "      },",
          "      \"envoyMetricsService\": {",
          "        \"enabled\": false,",
          "        \"tcpKeepalive\": {",
          "          \"interval\": \"10s\",",
          "          \"probes\": 3,",
          "          \"time\": \"10s\"",
          "        },",
          "        \"tlsSettings\": {",
          "          \"mode\": \"DISABLE\",",
          "          \"subjectAltNames\": []",
          "        }",
          "      },",
          "      \"envoyStatsd\": {",
          "        \"enabled\": false",
          "      },",
          "      \"excludeIPRanges\": \"\",",
          "      \"excludeInboundPorts\": \"\",",
          "      \"excludeOutboundPorts\": \"\",",
          "      \"image\": \"proxyv2\",",
          "      \"includeIPRanges\": \"*\",",
          "      \"includeInboundPorts\": \"*\",",
          "      \"kubevirtInterfaces\": \"\",",
          "      \"logLevel\": \"warning\",",
          "      \"privileged\": false,",
          "      \"protocolDetectionTimeout\": \"100ms\",",
          "      \"readinessFailureThreshold\": 30,",
          "      \"readinessInitialDelaySeconds\": 1,",
          "      \"readinessPeriodSeconds\": 2,",
          "      \"resources\": {",
          "        \"limits\": {",
          "          \"cpu\": \"2000m\",",
          "          \"memory\": \"1024Mi\"",
          "        },",
          "        \"requests\": {",
          "          \"cpu\": \"100m\",",
          "          \"memory\": \"128Mi\"",
          "        }",
          "      },",
          "      \"statusPort\": 15020,",
          "      \"tracer\": \"zipkin\"",
          "    },",
          "    \"proxy_init\": {",
          "      \"image\": \"proxyv2\",",
          "      \"resources\": {",
          "        \"limits\": {",
          "          \"cpu\": \"100m\",",
          "          \"memory\": \"50Mi\"",
          "        },",
          "        \"requests\": {",
          "          \"cpu\": \"10m\",",
          "          \"memory\": \"10Mi\"",
          "        }",
          "      }",
          "    },",
          "    \"sds\": {",
          "      \"enabled\": false,",
          "      \"token\": {",
          "        \"aud\": \"istio-ca\"",
          "      },",
          "      \"udsPath\": \"\"",
          "    },",
          "    \"securityNamespace\": \"istio-system\",",
          "    \"sts\": {",
          "      \"servicePort\": 0",
          "    },",
          "",
          "    \"tag\": \"1.5.1\",",
          "    \"telemetryNamespace\": \"istio-system\",",
          "    \"tracer\": {",
          "      \"datadog\": {",
          "        \"address\": \"$(HOST_IP):8126\"",
          "      },",
          "      \"lightstep\": {",
          "        \"accessToken\": \"\",",
          "        \"address\": \"\",",
          "        \"cacertPath\": \"\",",
          "        \"secure\": true",
          "      },",
          "      \"stackdriver\": {",
          "        \"debug\": false,",
          "        \"maxNumberOfAnnotations\": 200,",
          "        \"maxNumberOfAttributes\": 200,",
          "        \"maxNumberOfMessageEvents\": 200",
          "      },",
          "      \"zipkin\": {",
          "        \"address\": \"\"",
          "      }",
          "    },",
          "    \"trustDomain\": \"cluster.local\",",
          "    \"useMCP\": false",
          "  },",
          "  \"istio_cni\": {",
          "    \"enabled\": false",
          "  },",
          "  \"sidecarInjectorWebhook\": {",
          "    \"alwaysInjectSelector\": [],",
          "    \"enableNamespacesByDefault\": false,",
          "    \"enabled\": false,",
          "    \"image\": \"sidecar_injector\",",
          "    \"injectLabel\": \"istio-injection\",",
          "    \"injectedAnnotations\": {},",
          "    \"namespace\": \"istio-system\",",
          "    \"neverInjectSelector\": [],",
          "    \"objectSelector\": {",
          "      \"autoInject\": true,",
          "      \"enabled\": false",
          "    },",
          "    \"rewriteAppHTTPProbe\": false,",
          "    \"selfSigned\": false",
          "  }",
          "}"
        ]
      ),
      "config": std.join("\n",
        [
          "policy: enabled",
          "alwaysInjectSelector:",
          "        []",
          "neverInjectSelector:",
          "        []",
          "injectedAnnotations:",
          "",
          "# Configmap optimized for Istiod. Please DO NOT MERGE all changes from istio - in particular those dependent on",
          "# Values.yaml, which should not be used by istiod.",
          "",
          "# Istiod only uses SDS based config ( files will mapped/handled by SDS).",
          "",
          "template: |",
          "  rewriteAppHTTPProbe: {{ valueOrDefault .Values.sidecarInjectorWebhook.rewriteAppHTTPProbe false }}",
          "  initContainers:",
          "  {{ if ne (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) `NONE` }}",
          "  {{ if .Values.istio_cni.enabled -}}",
          "  - name: istio-validation",
          "  {{ else -}}",
          "  - name: istio-init",
          "  {{ end -}}",
          "  {{- if contains \"/\" .Values.global.proxy_init.image }}",
          "    image: \"{{ .Values.global.proxy_init.image }}\"",
          "  {{- else }}",
          "    image: \"{{ .Values.global.hub }}/{{ .Values.global.proxy_init.image }}:{{ .Values.global.tag }}\"",
          "  {{- end }}",
          "    command:",
          "    - istio-iptables",
          "    - \"-p\"",
          "    - 15001",
          "    - \"-z\"",
          "    - \"15006\"",
          "    - \"-u\"",
          "    - 1337",
          "    - \"-m\"",
          "    - \"{{ annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode }}\"",
          "    - \"-i\"",
          "    - \"{{ annotation .ObjectMeta `traffic.sidecar.istio.io/includeOutboundIPRanges` .Values.global.proxy.includeIPRanges }}\"",
          "    - \"-x\"",
          "    - \"{{ annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundIPRanges` .Values.global.proxy.excludeIPRanges }}\"",
          "    - \"-b\"",
          "    - \"{{ annotation .ObjectMeta `traffic.sidecar.istio.io/includeInboundPorts` `*` }}\"",
          "    - \"-d\"",
          "    - \"15090,{{ excludeInboundPort (annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort) (annotation .ObjectMeta `traffic.sidecar.istio.io/excludeInboundPorts` .Values.global.proxy.excludeInboundPorts) }}\"",
          "    {{ if or (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/excludeOutboundPorts`) (ne (valueOrDefault .Values.global.proxy.excludeOutboundPorts \"\") \"\") -}}",
          "    - \"-o\"",
          "    - \"{{ annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundPorts` .Values.global.proxy.excludeOutboundPorts }}\"",
          "    {{ end -}}",
          "    {{ if (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/kubevirtInterfaces`) -}}",
          "    - \"-k\"",
          "    - \"{{ index .ObjectMeta.Annotations `traffic.sidecar.istio.io/kubevirtInterfaces` }}\"",
          "    {{ end -}}",
          "    {{ if .Values.istio_cni.enabled -}}",
          "    - \"--run-validation\"",
          "    - \"--skip-rule-apply\"",
          "    {{ end -}}",
          "    imagePullPolicy: \"{{ valueOrDefault .Values.global.imagePullPolicy `Always` }}\"",
          "  {{- if .Values.global.proxy_init.resources }}",
          "    resources:",
          "      {{ toYaml .Values.global.proxy_init.resources | indent 4 }}",
          "  {{- else }}",
          "    resources: {}",
          "  {{- end }}",
          "    securityContext:",
          "      allowPrivilegeEscalation: {{ .Values.global.proxy.privileged }}",
          "      privileged: {{ .Values.global.proxy.privileged }}",
          "      capabilities:",
          "    {{- if not .Values.istio_cni.enabled }}",
          "        add:",
          "        - NET_ADMIN",
          "        - NET_RAW",
          "    {{- end }}",
          "        drop:",
          "        - ALL",
          "      readOnlyRootFilesystem: false",
          "    {{- if not .Values.istio_cni.enabled }}",
          "      runAsGroup: 0",
          "      runAsNonRoot: false",
          "      runAsUser: 0",
          "    {{- else }}",
          "      runAsGroup: 1337",
          "      runAsUser: 1337",
          "      runAsNonRoot: true",
          "    {{- end }}",
          "    restartPolicy: Always",
          "  {{ end -}}",
          "  {{- if eq .Values.global.proxy.enableCoreDump true }}",
          "  - name: enable-core-dump",
          "    args:",
          "    - -c",
          "    - sysctl -w kernel.core_pattern=/var/lib/istio/core.proxy && ulimit -c unlimited",
          "    command:",
          "      - /bin/sh",
          "  {{- if contains \"/\" .Values.global.proxy_init.image }}",
          "    image: \"{{ .Values.global.proxy_init.image }}\"",
          "  {{- else }}",
          "    image: \"{{ .Values.global.hub }}/{{ .Values.global.proxy_init.image }}:{{ .Values.global.tag }}\"",
          "  {{- end }}",
          "    imagePullPolicy: \"{{ valueOrDefault .Values.global.imagePullPolicy `Always` }}\"",
          "    resources: {}",
          "    securityContext:",
          "      allowPrivilegeEscalation: true",
          "      capabilities:",
          "        add:",
          "        - SYS_ADMIN",
          "        drop:",
          "        - ALL",
          "      privileged: true",
          "      readOnlyRootFilesystem: false",
          "      runAsGroup: 0",
          "      runAsNonRoot: false",
          "      runAsUser: 0",
          "  {{ end }}",
          "  containers:",
          "  - name: istio-proxy",
          "  {{- if contains \"/\" (annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image) }}",
          "    image: \"{{ annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image }}\"",
          "  {{- else }}",
          "    image: \"{{ .Values.global.hub }}/{{ .Values.global.proxy.image }}:{{ .Values.global.tag }}\"",
          "  {{- end }}",
          "    ports:",
          "    - containerPort: 15090",
          "      protocol: TCP",
          "      name: http-envoy-prom",
          "    args:",
          "    - proxy",
          "    - sidecar",
          "    - --domain",
          "    - $(POD_NAMESPACE).svc.{{ .Values.global.proxy.clusterDomain }}",
          "    - --configPath",
          "    - \"/etc/istio/proxy\"",
          "    - --binaryPath",
          "    - \"/usr/local/bin/envoy\"",
          "    - --serviceCluster",
          "    {{ if ne \"\" (index .ObjectMeta.Labels \"app\") -}}",
          "    - \"{{ index .ObjectMeta.Labels `app` }}.$(POD_NAMESPACE)\"",
          "    {{ else -}}",
          "    - \"{{ valueOrDefault .DeploymentMeta.Name `istio-proxy` }}.{{ valueOrDefault .DeploymentMeta.Namespace `default` }}\"",
          "    {{ end -}}",
          "    - --drainDuration",
          "    - \"{{ formatDuration .ProxyConfig.DrainDuration }}\"",
          "    - --parentShutdownDuration",
          "    - \"{{ formatDuration .ProxyConfig.ParentShutdownDuration }}\"",
          "    - --discoveryAddress",
          "    - \"{{ annotation .ObjectMeta `sidecar.istio.io/discoveryAddress` .ProxyConfig.DiscoveryAddress }}\"",
          "  {{- if eq .Values.global.proxy.tracer \"lightstep\" }}",
          "    - --lightstepAddress",
          "    - \"{{ .ProxyConfig.GetTracing.GetLightstep.GetAddress }}\"",
          "    - --lightstepAccessToken",
          "    - \"{{ .ProxyConfig.GetTracing.GetLightstep.GetAccessToken }}\"",
          "    - --lightstepSecure={{ .ProxyConfig.GetTracing.GetLightstep.GetSecure }}",
          "    - --lightstepCacertPath",
          "    - \"{{ .ProxyConfig.GetTracing.GetLightstep.GetCacertPath }}\"",
          "  {{- else if eq .Values.global.proxy.tracer \"zipkin\" }}",
          "    - --zipkinAddress",
          "    - \"{{ .ProxyConfig.GetTracing.GetZipkin.GetAddress }}\"",
          "  {{- else if eq .Values.global.proxy.tracer \"datadog\" }}",
          "    - --datadogAgentAddress",
          "    - \"{{ .ProxyConfig.GetTracing.GetDatadog.GetAddress }}\"",
          "  {{- end }}",
          "    - --proxyLogLevel={{ annotation .ObjectMeta `sidecar.istio.io/logLevel` .Values.global.proxy.logLevel}}",
          "    - --proxyComponentLogLevel={{ annotation .ObjectMeta `sidecar.istio.io/componentLogLevel` .Values.global.proxy.componentLogLevel}}",
          "    - --connectTimeout",
          "    - \"{{ formatDuration .ProxyConfig.ConnectTimeout }}\"",
          "  {{- if .Values.global.proxy.envoyStatsd.enabled }}",
          "    - --statsdUdpAddress",
          "    - \"{{ .ProxyConfig.StatsdUdpAddress }}\"",
          "  {{- end }}",
          "  {{- if .Values.global.proxy.envoyMetricsService.enabled }}",
          "    - --envoyMetricsService",
          "    - '{{ protoToJSON .ProxyConfig.EnvoyMetricsService }}'",
          "  {{- end }}",
          "  {{- if .Values.global.proxy.envoyAccessLogService.enabled }}",
          "    - --envoyAccessLogService",
          "    - '{{ protoToJSON .ProxyConfig.EnvoyAccessLogService }}'",
          "  {{- end }}",
          "    - --proxyAdminPort",
          "    - \"{{ .ProxyConfig.ProxyAdminPort }}\"",
          "    {{ if gt .ProxyConfig.Concurrency 0 -}}",
          "    - --concurrency",
          "    - \"{{ .ProxyConfig.Concurrency }}\"",
          "    {{ end -}}",
          "    {{- if .Values.global.istiod.enabled }}",
          "    - --controlPlaneAuthPolicy",
          "    - NONE",
          "    {{- else if .Values.global.controlPlaneSecurityEnabled }}",
          "    - --controlPlaneAuthPolicy",
          "    - MUTUAL_TLS",
          "    {{- else }}",
          "    - --controlPlaneAuthPolicy",
          "    - NONE",
          "    {{- end }}",
          "    - --dnsRefreshRate",
          "    - {{ valueOrDefault .Values.global.proxy.dnsRefreshRate \"300s\" }}",
          "  {{- if (ne (annotation .ObjectMeta \"status.sidecar.istio.io/port\" .Values.global.proxy.statusPort) \"0\") }}",
          "    - --statusPort",
          "    - \"{{ annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort }}\"",
          "  {{- end }}",
          "  {{- if .Values.global.sts.servicePort }}",
          "    - --stsPort={{ .Values.global.sts.servicePort }}",
          "  {{- end }}",
          "  {{- if .Values.global.trustDomain }}",
          "    - --trust-domain={{ .Values.global.trustDomain }}",
          "  {{- end }}",
          "  {{- if .Values.global.logAsJson }}",
          "    - --log_as_json",
          "  {{- end }}",
          "    - --controlPlaneBootstrap=false",
          "  {{- if .Values.global.proxy.lifecycle }}",
          "    lifecycle:",
          "      {{ toYaml .Values.global.proxy.lifecycle | indent 4 }}",
          "    {{- end }}",
          "    env:",
          "    - name: JWT_POLICY",
          "      value: {{ .Values.global.jwtPolicy }}",
          "    - name: PILOT_CERT_PROVIDER",
          "      value: {{ .Values.global.pilotCertProvider }}",
          "    # Temp, pending PR to make it default or based on the istiodAddr env",
          "    - name: CA_ADDR",
          "    {{- if .Values.global.caAddress }}",
          "      value: {{ .Values.global.caAddress }}",
          "    {{- else if .Values.global.configNamespace }}",
          "      value: istio-pilot.{{ .Values.global.configNamespace }}.svc:15012",
          "    {{- else }}",
          "      value: istio-pilot.istio-system.svc:15012",
          "    {{- end }}",
          "    - name: POD_NAME",
          "      valueFrom:",
          "        fieldRef:",
          "          fieldPath: metadata.name",
          "    - name: POD_NAMESPACE",
          "      valueFrom:",
          "        fieldRef:",
          "          fieldPath: metadata.namespace",
          "    - name: INSTANCE_IP",
          "      valueFrom:",
          "        fieldRef:",
          "          fieldPath: status.podIP",
          "    - name: SERVICE_ACCOUNT",
          "      valueFrom:",
          "        fieldRef:",
          "          fieldPath: spec.serviceAccountName",
          "    - name: HOST_IP",
          "      valueFrom:",
          "        fieldRef:",
          "          fieldPath: status.hostIP",
          "  {{- if eq .Values.global.proxy.tracer \"datadog\" }}",
          "  {{- if isset .ObjectMeta.Annotations `apm.datadoghq.com/env` }}",
          "  {{- range $key, $value := fromJSON (index .ObjectMeta.Annotations `apm.datadoghq.com/env`) }}",
          "    - name: {{ $key }}",
          "      value: \"{{ $value }}\"",
          "  {{- end }}",
          "  {{- end }}",
          "  {{- end }}",
          "    - name: ISTIO_META_POD_PORTS",
          "      value: |-",
          "        [",
          "        {{- $first := true }}",
          "        {{- range $index1, $c := .Spec.Containers }}",
          "          {{- range $index2, $p := $c.Ports }}",
          "            {{- if (structToJSON $p) }}",
          "            {{if not $first}},{{end}}{{ structToJSON $p }}",
          "            {{- $first = false }}",
          "            {{- end }}",
          "          {{- end}}",
          "        {{- end}}",
          "        ]",
          "    - name: ISTIO_META_CLUSTER_ID",
          "      value: \"{{ valueOrDefault .Values.global.multiCluster.clusterName `Kubernetes` }}\"",
          "    - name: ISTIO_META_POD_NAME",
          "      valueFrom:",
          "        fieldRef:",
          "          fieldPath: metadata.name",
          "    - name: ISTIO_META_CONFIG_NAMESPACE",
          "      valueFrom:",
          "        fieldRef:",
          "          fieldPath: metadata.namespace",
          "    - name: ISTIO_META_INTERCEPTION_MODE",
          "      value: \"{{ or (index .ObjectMeta.Annotations `sidecar.istio.io/interceptionMode`) .ProxyConfig.InterceptionMode.String }}\"",
          "    {{- if .Values.global.network }}",
          "    - name: ISTIO_META_NETWORK",
          "      value: \"{{ .Values.global.network }}\"",
          "    {{- end }}",
          "    {{ if .ObjectMeta.Annotations }}",
          "    - name: ISTIO_METAJSON_ANNOTATIONS",
          "      value: |",
          "             {{ toJSON .ObjectMeta.Annotations }}",
          "    {{ end }}",
          "    {{- if .DeploymentMeta.Name }}",
          "    - name: ISTIO_META_WORKLOAD_NAME",
          "      value: {{ .DeploymentMeta.Name }}",
          "    {{ end }}",
          "    {{- if and .TypeMeta.APIVersion .DeploymentMeta.Name }}",
          "    - name: ISTIO_META_OWNER",
          "      value: kubernetes://apis/{{ .TypeMeta.APIVersion }}/namespaces/{{ valueOrDefault .DeploymentMeta.Namespace `default` }}/{{ toLower .TypeMeta.Kind}}s/{{ .DeploymentMeta.Name }}",
          "    {{- end}}",
          "    {{- if (isset .ObjectMeta.Annotations `sidecar.istio.io/bootstrapOverride`) }}",
          "    - name: ISTIO_BOOTSTRAP_OVERRIDE",
          "      value: \"/etc/istio/custom-bootstrap/custom_bootstrap.json\"",
          "    {{- end }}",
          "    {{- if .Values.global.meshID }}",
          "    - name: ISTIO_META_MESH_ID",
          "      value: \"{{ .Values.global.meshID }}\"",
          "    {{- else if .Values.global.trustDomain }}",
          "    - name: ISTIO_META_MESH_ID",
          "      value: \"{{ .Values.global.trustDomain }}\"",
          "    {{- end }}",
          "    {{- if eq .Values.global.proxy.tracer \"stackdriver\" }}",
          "    - name: STACKDRIVER_TRACING_ENABLED",
          "      value: \"true\"",
          "    - name: STACKDRIVER_TRACING_DEBUG",
          "      value: \"{{ .ProxyConfig.GetTracing.GetStackdriver.GetDebug }}\"",
          "    - name: STACKDRIVER_TRACING_MAX_NUMBER_OF_ANNOTATIONS",
          "      value: \"{{ .ProxyConfig.GetTracing.GetStackdriver.GetMaxNumberOfAnnotations.Value }}\"",
          "    - name: STACKDRIVER_TRACING_MAX_NUMBER_OF_ATTRIBUTES",
          "      value: \"{{ .ProxyConfig.GetTracing.GetStackdriver.GetMaxNumberOfAttributes.Value }}\"",
          "    - name: STACKDRIVER_TRACING_MAX_NUMBER_OF_MESSAGE_EVENTS",
          "      value: \"{{ .ProxyConfig.GetTracing.GetStackdriver.GetMaxNumberOfMessageEvents.Value }}\"",
          "    {{- end }}",
          "    {{- if and (eq .Values.global.proxy.tracer \"datadog\") (isset .ObjectMeta.Annotations `apm.datadoghq.com/env`) }}",
          "    {{- range $key, $value := fromJSON (index .ObjectMeta.Annotations `apm.datadoghq.com/env`) }}",
          "      - name: {{ $key }}",
          "        value: \"{{ $value }}\"",
          "    {{- end }}",
          "    {{- end }}",
          "    {{- range $key, $value := .ProxyConfig.ProxyMetadata }}",
          "    - name: {{ $key }}",
          "      value: \"{{ $value }}\"",
          "    {{- end }}",
          "    imagePullPolicy: \"{{ valueOrDefault .Values.global.imagePullPolicy `Always` }}\"",
          "    {{ if ne (annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort) `0` }}",
          "    readinessProbe:",
          "      httpGet:",
          "        path: /healthz/ready",
          "        port: {{ annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort }}",
          "      initialDelaySeconds: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/initialDelaySeconds` .Values.global.proxy.readinessInitialDelaySeconds }}",
          "      periodSeconds: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/periodSeconds` .Values.global.proxy.readinessPeriodSeconds }}",
          "      failureThreshold: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/failureThreshold` .Values.global.proxy.readinessFailureThreshold }}",
          "    {{ end -}}",
          "    securityContext:",
          "      allowPrivilegeEscalation: {{ .Values.global.proxy.privileged }}",
          "      capabilities:",
          "        {{ if or (eq (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) `TPROXY`) (eq (annotation .ObjectMeta `sidecar.istio.io/capNetBindService` .Values.global.proxy.capNetBindService) `true`) -}}",
          "        add:",
          "        {{ if eq (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) `TPROXY` -}}",
          "        - NET_ADMIN",
          "        {{- end }}",
          "        {{ if eq (annotation .ObjectMeta `sidecar.istio.io/capNetBindService` .Values.global.proxy.capNetBindService) `true` -}}",
          "        - NET_BIND_SERVICE",
          "        {{- end }}",
          "        {{- end }}",
          "        drop:",
          "        - ALL",
          "      privileged: {{ .Values.global.proxy.privileged }}",
          "      readOnlyRootFilesystem: {{ not .Values.global.proxy.enableCoreDump }}",
          "      runAsGroup: 1337",
          "      fsGroup: 1337",
          "      {{ if or (eq (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) `TPROXY`) (eq (annotation .ObjectMeta `sidecar.istio.io/capNetBindService` .Values.global.proxy.capNetBindService) `true`) -}}",
          "      runAsNonRoot: false",
          "      runAsUser: 0",
          "      {{- else -}}",
          "      runAsNonRoot: true",
          "      runAsUser: 1337",
          "      {{- end }}",
          "    resources:",
          "      {{ if or (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory`) -}}",
          "      requests:",
          "        {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) -}}",
          "        cpu: \"{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU` }}\"",
          "        {{ end}}",
          "        {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory`) -}}",
          "        memory: \"{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory` }}\"",
          "        {{ end }}",
          "    {{ else -}}",
          "  {{- if .Values.global.proxy.resources }}",
          "      {{ toYaml .Values.global.proxy.resources | indent 4 }}",
          "  {{- end }}",
          "    {{  end -}}",
          "    volumeMounts:",
          "    {{- if eq .Values.global.pilotCertProvider \"istiod\" }}",
          "    - mountPath: /var/run/secrets/istio",
          "      name: istiod-ca-cert",
          "    {{- end }}",
          "    {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/bootstrapOverride`) }}",
          "    - mountPath: /etc/istio/custom-bootstrap",
          "      name: custom-bootstrap-volume",
          "    {{- end }}",
          "    # SDS channel between istioagent and Envoy",
          "    - mountPath: /etc/istio/proxy",
          "      name: istio-envoy",
          "    {{- if eq .Values.global.jwtPolicy \"third-party-jwt\" }}",
          "    - mountPath: /var/run/secrets/tokens",
          "      name: istio-token",
          "    {{- end }}",
          "    {{- if .Values.global.mountMtlsCerts }}",
          "    # Use the key and cert mounted to /etc/certs/ for the in-cluster mTLS communications.",
          "    - mountPath: /etc/certs/",
          "      name: istio-certs",
          "      readOnly: true",
          "    {{- end }}",
          "    - name: podinfo",
          "      mountPath: /etc/istio/pod",
          "    {{- if and (eq .Values.global.proxy.tracer \"lightstep\") .Values.global.tracer.lightstep.cacertPath }}",
          "    - mountPath: {{ directory .ProxyConfig.GetTracing.GetLightstep.GetCacertPath }}",
          "      name: lightstep-certs",
          "      readOnly: true",
          "    {{- end }}",
          "      {{- if isset .ObjectMeta.Annotations `sidecar.istio.io/userVolumeMount` }}",
          "      {{ range $index, $value := fromJSON (index .ObjectMeta.Annotations `sidecar.istio.io/userVolumeMount`) }}",
          "    - name: \"{{  $index }}\"",
          "      {{ toYaml $value | indent 4 }}",
          "      {{ end }}",
          "      {{- end }}",
          "  volumes:",
          "  {{- if (isset .ObjectMeta.Annotations `sidecar.istio.io/bootstrapOverride`) }}",
          "  - name: custom-bootstrap-volume",
          "    configMap:",
          "      name: {{ annotation .ObjectMeta `sidecar.istio.io/bootstrapOverride` \"\" }}",
          "  {{- end }}",
          "  # SDS channel between istioagent and Envoy",
          "  - emptyDir:",
          "      medium: Memory",
          "    name: istio-envoy",
          "  - name: podinfo",
          "    downwardAPI:",
          "      items:",
          "        - path: \"labels\"",
          "          fieldRef:",
          "            fieldPath: metadata.labels",
          "        - path: \"annotations\"",
          "          fieldRef:",
          "            fieldPath: metadata.annotations",
          "  {{- if eq .Values.global.jwtPolicy \"third-party-jwt\" }}",
          "  - name: istio-token",
          "    projected:",
          "      sources:",
          "      - serviceAccountToken:",
          "          path: istio-token",
          "          expirationSeconds: 43200",
          "          audience: {{ .Values.global.sds.token.aud }}",
          "  {{- end }}",
          "  {{- if eq .Values.global.pilotCertProvider \"istiod\" }}",
          "  - name: istiod-ca-cert",
          "    configMap:",
          "      name: istio-ca-root-cert",
          "  {{- end }}",
          "  {{- if .Values.global.mountMtlsCerts }}",
          "  # Use the key and cert mounted to /etc/certs/ for the in-cluster mTLS communications.",
          "  - name: istio-certs",
          "    secret:",
          "      optional: true",
          "      {{ if eq .Spec.ServiceAccountName \"\" }}",
          "      secretName: istio.default",
          "      {{ else -}}",
          "      secretName: {{  printf \"istio.%s\" .Spec.ServiceAccountName }}",
          "      {{  end -}}",
          "  {{- end }}",
          "    {{- if isset .ObjectMeta.Annotations `sidecar.istio.io/userVolume` }}",
          "    {{range $index, $value := fromJSON (index .ObjectMeta.Annotations `sidecar.istio.io/userVolume`) }}",
          "  - name: \"{{ $index }}\"",
          "    {{ toYaml $value | indent 2 }}",
          "    {{ end }}",
          "    {{ end }}",
          "  {{- if and (eq .Values.global.proxy.tracer \"lightstep\") .Values.global.tracer.lightstep.cacertPath }}",
          "  - name: lightstep-certs",
          "    secret:",
          "      optional: true",
          "      secretName: lightstep.cacert",
          "  {{- end }}",
          "  {{- if .Values.global.podDNSSearchNamespaces }}",
          "  dnsConfig:",
          "    searches:",
          "      {{- range .Values.global.podDNSSearchNamespaces }}",
          "      - {{ render . }}",
          "      {{- end }}",
          "  {{- end }}",
          "  podRedirectAnnot:",
          "    sidecar.istio.io/interceptionMode: \"{{ annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode }}\"",
          "    traffic.sidecar.istio.io/includeOutboundIPRanges: \"{{ annotation .ObjectMeta `traffic.sidecar.istio.io/includeOutboundIPRanges` .Values.global.proxy.includeIPRanges }}\"",
          "    traffic.sidecar.istio.io/excludeOutboundIPRanges: \"{{ annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundIPRanges` .Values.global.proxy.excludeIPRanges }}\"",
          "    traffic.sidecar.istio.io/includeInboundPorts: \"{{ annotation .ObjectMeta `traffic.sidecar.istio.io/includeInboundPorts` (includeInboundPorts .Spec.Containers) }}\"",
          "    traffic.sidecar.istio.io/excludeInboundPorts: \"{{ excludeInboundPort (annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort) (annotation .ObjectMeta `traffic.sidecar.istio.io/excludeInboundPorts` .Values.global.proxy.excludeInboundPorts) }}\"",
          "  {{ if or (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/excludeOutboundPorts`) (ne .Values.global.proxy.excludeOutboundPorts \"\") }}",
          "    traffic.sidecar.istio.io/excludeOutboundPorts: \"{{ annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundPorts` .Values.global.proxy.excludeOutboundPorts }}\"",
          "  {{- end }}",
          "    traffic.sidecar.istio.io/kubevirtInterfaces: \"{{ index .ObjectMeta.Annotations `traffic.sidecar.istio.io/kubevirtInterfaces` }}\""
        ]
      )
    }
  }
]
