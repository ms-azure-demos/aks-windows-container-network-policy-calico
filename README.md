# Testing Kubernetes network policy in AKS Cluster with Calico

- Demos how the network policy can be enforced to deployment pods
- Blocks outbound communication. 
- Uses [Calico](https://projectcalico.docs.tigera.io/security/calico-network-policy)
- Currently this repo include same for windows container. Expecting this to work same for Linux containers as well.

# How to run

- Create vNet and Subnet for AKS
- Replace values in the [params file](./commands/00-env-params.ps1)
- Navigate to [commands](./commands) folder
- [Create cluster with calico enabled](/commands/05-env-deploy-aks.ps1)
- Manually add windows node pool as the above will be creating only Linux node pool
- [Deploy the HELM chart](./commands/11-app-deploy-helm.ps1)

By default it will make http calls

## Reproduce error
- Change the [network-policy.yml](./helm/templates/network-policy.yml) to remove github IPs
- Deploy HELM chart again
- This will not restart the container. So better delete the pod.

# How the PoC structured

- The container is running a command that makes web request to [joymon.github.io](joymon.github.io)
- It will work by default as the [network-policy.yml](./helm/templates/network-policy.yml) has the required IPs in egress
  - Recommends reading the [container specs](./helm/templates/deployment-nanoserver.yaml) for better understandability of the container going to behave
- Remove the last 4 ipBlocks from network-policy.yml file to ensure its blocking the network traffic.