#!/bin/bash

envsubst < demo/my-gateway.yaml.in > demo/my-gateway.yaml
envsubst < demo/my-gateway-ingress.yaml.in > demo/my-gateway-ingress.yaml
envsubst < demo/helloworld-gateway-mapping.yaml.in > demo/helloworld-gateway-mapping.yaml
envsubst < demo/github-gateway-mapping.yaml.in > demo/github-gateway-mapping.yaml
envsubst < demo/github-route-config.yaml.in > demo/github-route-config.yaml
envsubst < demo/github-ratelimit-route-config.yaml.in > demo/github-ratelimit-route-config.yaml
envsubst < animal-rescue/base/gateway-demo-ingress.yaml.in > animal-rescue/base/gateway-demo-ingress.yaml

