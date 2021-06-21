#!/bin/bash

envsubst < demo/my-gateway.yaml.in > demo/my-gateway.yaml
envsubst < demo/my-gateway-ingress.yaml.in > demo/my-gateway-ingress.yaml
envsubst < demo/helloworld-gateway-mapping.yaml.in > demo/helloworld-gateway-mapping.yaml
envsubst < demo/github-gateway-mapping.yaml.in > demo/github-gateway-mapping.yaml

