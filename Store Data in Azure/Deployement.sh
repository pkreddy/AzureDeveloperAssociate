#!/bin/sh
az account set --subscription "Concierge Subscription"
cd "/mnt/f/Azure/AZ-204/AzureDeveloperAssociate/Store Data in Azure/Module2"
az deployment group create --resource-group learn-aedb3b78-71f3-4bcf-ad13-4c5d66bb65b0 --template-file template.json --parameters parameters.json
