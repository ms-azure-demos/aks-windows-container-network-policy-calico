
$resourceGroup = "<rg of aks>"

############################ AKS Specific ##############################
$clusterName = "aks name"
$aksSubnetName = "aks subnet"
$vNetName = "aks-vnet"
########################## AKS app deployment ##########################
$namespace = "network-policy-test" # this is nothing but the subdomain
$imageRepository = "mcr.microsoft.com/powershell" # Any image that expose http server over 80 eg: mendhak/http-https-echo, hashicorp/http-echo
$imageTag = "lts-7.2-nanoserver-1809"