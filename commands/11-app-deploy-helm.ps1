##################### Merge credentials ######################
. ./00-env-params.ps1
az aks get-credentials --resource-group $resourceGroup  --name $clusterName
##############################################################

################### Params to change #########################
$location = "../helm"

##############################################################
helm upgrade network-policy-test ../helm --install --set namespace=$namespace --set image.repository=$imageRepository --set image.tag=$imageTag
#helm template network-policy-test ../helm  --set namespace=$namespace --set image.repository=$imageRepository --set image.tag=$imageTag
# helm uninstall "venus"