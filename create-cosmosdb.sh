# Declare variables
resourceGroup="rk_group"  # Corrected the variable name
location="eastus"
accountName="dbrahulsinha"  # Corrected the variable name
database="Mydb"

# Create a resource group
az group create --name $resourceGroup --location $location

# Create an Azure Cosmos DB account
az cosmosdb create --name $accountName --resource-group $resourceGroup --default-consistency-level Eventual --locations regionName=$location isZoneRedundant=False

# Create a SQL database within the Cosmos DB account
az cosmosdb sql database create --account-name $accountName --resource-group $resourceGroup --name $database
