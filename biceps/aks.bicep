param location string = resourceGroup().location
param clusterName string
param nodeCount int = 1
param vmSize string = 'standard_d2s_v5'
param vNetName string 
param aksSubnetName string

resource aksSubnet 'Microsoft.Network/virtualNetworks/subnets@2022-05-01' existing  ={
  name:'${vNetName}/${aksSubnetName}'
}
resource aks 'Microsoft.ContainerService/managedClusters@2022-09-01' = {
  location:location
  name:clusterName
  dependsOn:[
  ]
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: clusterName
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: 'linuxpool1'
        count: nodeCount
        vmSize: vmSize
        mode: 'System'
        vnetSubnetID:aksSubnet.id
      }
    ]
    networkProfile: {
      networkPlugin:'azure' 
      networkPolicy:'calico'
      
      serviceCidr:'10.240.0.0/16'
      dnsServiceIP:'10.240.0.10'
    }
    addonProfiles : {
    }
  }
}
