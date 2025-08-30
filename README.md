![game-running](https://github.com/user-attachments/assets/51042130-9835-4cc5-9995-28e194eebaa2)
# EKS-2048-game
> Deployed 2048 game on AWS EKS using Fargate, automated ALB provisioning via Helm, and configured IAM roles for secure access - demonstrating Kubernetes and cloud-native deployment skills.

---

## 🚀 Features / Key Highlights
- Deployed a scalable 2048 game application on AWS Elastic Kubernetes Service (EKS) using Fargate for serverless container management.
- Automated Application Load Balancer (ALB) provisioning via Helm chart for efficient traffic routing and management.
- Configured fine-grained IAM roles for Kubernetes service accounts ensuring secure, least-privilege access to AWS resources.

---

## 🛠️ Tech Stack
| Category        | Technologies                                              |
|-----------------|-----------------------------------------------------------|
| Languages       | Shell                                                     |
| Cloud Services  | AWS EKS, AWS Fargate, AWS IAM, Application Load Balancer  |
| Tools & Others  | Helm, kubectl, eksctl, Kubernetes                         |

---

## ⚙️ Setup & Installation Guide

Step 1: Clone the repo
git clone https://github.com/Nirmal-aditya/EKS-2048-game.git

Step 2: Navigate into directory
cd EKS-2048-game

Step 3: Create EKS cluster with Fargate using eksctl
eksctl create cluster --name eks-2048game --fargate

Step 4: Create Fargate profile and namespace
eksctl create fargateprofile --cluster eks-2048game --name game-2048 --namespace game-2048

Step 5: Install AWS Load Balancer Controller CRDs using kubectl
kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"

Step 6: Add Helm repo and install ALB Controller (replace <VPC_ID>)
helm repo add eks https://aws.github.io/eks-charts
helm repo update
helm install aws-load-balancer-controller eks/aws-load-balancer-controller
--set clusterName=eks-2048game
--set serviceAccount.create=false
--set serviceAccount.name=aws-load-balancer-controller
--set region=us-east-1
--set vpcId=<VPC_ID>
-n kube-system

Step 7: Deploy the 2048 game app using Helm or kubectl manifests
kubectl apply -f deployment.yaml

Step 8: Get the ALB DNS to access the app
kubectl get ingress -n game-2048

---

## 🎬 Usage / Demo
> Play the 2048 game through the public URL provided by the ALB once deployed.

---

## 🌟 Real-World Impact
- Demonstrates Kubernetes scaling best practices using AWS EKS and Fargate serverless compute.
- Automates secure cloud-native deployments reducing manual cloud resource management overhead.

---

## 🎯 Certifications / Skills Demonstrated
- OCI Certified Architect Associate, Foundations Associate.
- concepts leveraged (EKS, IAM roles, ALB).
- Kubernetes and DevOps automation with Helm and eksctl.
- Cloud networking and security via IAM role and Application Load Balancer setup.

---

## 📬 Contact / Let’s Connect
Reach out for collaboration:  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?logo=linkedin)](https://www.linkedin.com/in/nirmaladitya)


---
