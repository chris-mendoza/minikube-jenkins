## Minikube Install

https://minikube.sigs.k8s.io/docs/start/

### Create Minikube with Profile

`time minikube start -p my-profile`

View all pods in All Namespaces:

`kubectl get po -A`

Use minikube to run a compatable Kubectl command:
`minikube kubectl -- get po -A`

Change default memory limit (Requires restart):
`minikube config set memory 9001`

Minikube Dashboard (Must be run in GUI):
`minikube dashboard`

Minikube Addon List
`minikube addons list`

Delete all Minikube Clusters:
`minikube delete --all`
