## Kubernetes Command Cheat Sheet

### Get all Pods

`kubectl get pods -A`

### Get Namespaces

`kubectl get namespaces`

### View the coredns pods

`kubectl get pods -n kube-system`

### View the CoreDNS Deployments

`kubectl get deployments -n kube-system`

### View the Kube-DNS Service

`kubectl get services -n kube-system`

### Create a busybox pod from a file

`kubectl create -f busybox.yaml`

### Look at the resolv.conf

`kubectl exec -it busybox -- cat /etc/resolv.conf`

### Lookup the Kubernetes Service DNS

`kubectl exec -it busybox --nslookup kubernetes`

### Lookup a pod DNS

`kubectl exec -it busybox -- nslookup 10.244-1-2.default.pod.cluster.local`

### Lookup a service DNS

`kubectl exec -it busybox -- nslookup kube-dns.kube-system.svc.cluster.local`

### Describe Kubectl Services

`kubectl describe service ingress-nginx`

### Get Kubectl Context

`kubectl config current-context`

### Use Docker Daemon within Minikube

`eval $(minikube docker-env)`

### Revert from within Docker Daemon

`eval $(minikube docker-env -u)`