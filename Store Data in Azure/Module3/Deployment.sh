#!/bin/sh
az account set --subscription "Concierge Subscription"

az storage account create \
         --resource-group learn-bac85031-8850-4b6e-979f-a19a551f7b3b \
         --kind StorageV2 \
         --sku Standard_LRS \
         --access-tier Cool \
         --name storagemodule2pkatta
