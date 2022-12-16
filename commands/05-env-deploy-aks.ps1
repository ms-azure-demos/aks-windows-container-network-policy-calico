
# run this file from /commands folder
. ./00-env-params.ps1
az deployment group create -f ../biceps/aks.bicep -g $resourceGroup -p clusterName=$clusterName -p aksSubnetName=$aksSubnetName -p vNetName=$vNetName  #--what-if