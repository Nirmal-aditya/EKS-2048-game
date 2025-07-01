#!/bin/bash
# Deploys 2048 game to EKS

echo "Creating game namespace..."
kubectl create ns game-2048

echo "Deploying 2048 game..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml

echo "Waiting for ingress to be ready..."
kubectl wait --for=condition=available deployment -n game-2048 --timeout=300s --all

echo "Game deployed! Access URL:"
kubectl get ingress -n game-2048 -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
