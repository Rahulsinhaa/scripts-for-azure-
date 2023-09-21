#!/bin/bash

# Define variables
resourceGroupName="myResourceGroup"
location="eastus"  # Replace with your desired Azure region
aksClusterName="myAKSCluster"
nodeCount=1

# Create a resource group
az group create --name $resourceGroupName --location $location

# Create an AKS cluster
az aks create \
  --resource-group $resourceGroupName \
  --name $aksClusterName \
  --node-count $nodeCount \
  --enable-addons monitoring \
  --generate-ssh-keys

# Get AKS credentials
az aks get-credentials --resource-group $resourceGroupName --name $aksClusterName

# Deploy a sample pod
kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/nginx-app.yaml

# Verify the pod is running
kubectl get pods

# You can also expose the pod using a service if needed
# kubectl expose deployment nginx-app --port=80 --type=LoadBalancer

# To clean up resources (optional)
# az group delete --name $resourceGroupName --yes --no-wait
