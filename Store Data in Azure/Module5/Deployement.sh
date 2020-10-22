#!/bin/sh
az account set --subscription "Concierge Subscription"
az storage account create \
	  --kind StorageV2 \
	  --resource-group learn-23fe4bd6-c13c-474e-93a7-871ec1797d24 \
	  --location centralus \
	  --name adlpkattamodule5

# git clone https://github.com/MicrosoftDocs/mslearn-store-data-in-azure.git
# cd mslearn-store-data-in-azure/store-app-data-with-azure-blob-storage/src/start:wq

az appservice plan create --name blob-exercise-plan --resource-group learn-4838d452-cf57-46b6-bed8-5e51ba42a919 --sku FREE --location eastus2
az webapp create --name azuipkattamodule5  --plan blob-exercise-plan --resource-group learn-4838d452-cf57-46b6-bed8-5e51ba42a919
CONNECTIONSTRING=$(az storage account show-connection-string --name adlpkattamodule5 --output tsv)
az webapp config appsettings set --name azuipkattamodule5 --resource-group learn-4838d452-cf57-46b6-bed8-5e51ba42a919 --settings AzureStorageConfig:ConnectionString=$CONNECTIONSTRING AzureStorageConfig:FileContainerName=files

cd mslearn-store-data-in-azure/store-app-data-with-azure-blob-storage/src/start/

dotnet publish -o pub
cd pub
zip -r ../site.zip *
az webapp deployment source config-zip --src ../site.zip --name adlpkattamodule5 --resource-group learn-4838d452-cf57-46b6-bed8-5e51ba42a919
