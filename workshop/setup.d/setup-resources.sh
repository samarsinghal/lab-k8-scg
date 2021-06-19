#!/bin/bash

envsubst < demo/my-gateway-ingress.yaml.in > demo/my-gateway-ingress.yaml


# envsubst < k8-networking/helloworld-ingress.yaml.in > k8-networking/helloworld-ingress.yaml
# envsubst < k8-networking/helloworld-ingress-subdomain.yaml.in > k8-networking/helloworld-ingress-subdomain.yaml
# envsubst < k8-networking/helloworld-ingressroute.yaml.in > k8-networking/helloworld-ingressroute.yaml


# envsubst < frontend/ingress.yaml.in > frontend/ingress.yaml
# envsubst < frontend-v3/ingress.yaml.in > frontend-v3/ingress.yaml
# envsubst < frontend-v4/ingress.yaml.in > frontend-v4/ingress.yaml
# envsubst < frontend-v5/ingress.yaml.in > frontend-v5/ingress.yaml
