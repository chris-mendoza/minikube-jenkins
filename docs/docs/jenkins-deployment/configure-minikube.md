## Configure Minikube

Since we will be using Docker as the virtualization provider for Minikube, we will need to configure the network so that we can serve traffic on an ip address of our choosing.

## Docker Network



```bash

docker network create \
    --subnet=192.168.100.0/24 \ 
    --gateway 192.168.100.1 \
    -o "com.docker.network.bridge.host_binding_ipv4"="192.168.100.2" \ waffles-network

```

### Docker Network Inspect Output

```bash

$ docker network inspect waffles-network
[
    {
        "Name": "waffles-network",
        "Id": "353d705d09a5c1befaf25a554b5ca21af89bfd013cd178e11d59a83dc391cef9",
        "Created": "2024-04-21T15:42:45.536860029-05:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "192.168.100.0/24",
                    "Gateway": "192.168.100.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {
            "com.docker.network.bridge.host_binding_ipv4": "192.168.100.2"
        },
        "Labels": {}
    }
]
```

### Start Minikube Service using waffles-network

```bash
minikube start \
    --driver=docker \ 
    --memory=2048m \
    --network='waffles-network'
```

### Cluster Diagnostic Script

```bash
#!/bin/bash
minikube status
echo "Pods"
kubectl get pods -A
echo "Services"
kubectl get services -A
echo "Deployments"
kubectl get deployments -A
echo "Services"
kubectl get services -A
```