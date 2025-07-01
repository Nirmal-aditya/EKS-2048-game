#!/bin/bash
# Creates EKS cluster with Fargate profile for 2048 game

echo "Creating EKS cluster..."
eksctl create cluster \
  --name demo-cluster \
  --region us-east-1 \
  --fargate

echo "Creating Fargate profile for game-2048 namespace..."
eksctl create fargateprofile \
  --cluster demo-cluster \
  --region us-east-1 \
  --name alb-sample-app \
  --namespace game-2048

echo "Configuring kubectl context..."
aws eks update-kubeconfig --name demo-cluster --region us-east-1

echo "Cluster setup complete!"
