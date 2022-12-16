##########################

DEBUG ONLY. THIS IS NOT WORKING. RECREATE CLUSTER WITH CALICO ENABLED

##########################
#kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/tigera-operator.yaml
kubectl apply -f ./calico-install.yml 
# check installation kubectl get pods -n calico-system