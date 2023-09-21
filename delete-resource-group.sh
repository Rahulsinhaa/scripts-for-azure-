#!/bin/bash




# Prompt for the resource group name
read -p "Enter the name of the resource group to delete: " resourceGroup

# Check if the resource group exists before attempting to delete it
if az group show --name $resourceGroup &>/dev/null; then
  # Delete the resource group
  az group delete --name $resourceGroup --yes --no-wait
  echo "Resource group $resourceGroup is being deleted. You can check the status using 'az group show -n $resourceGroup'"
else
  echo "Resource group $resourceGroup does not exist."
fi
