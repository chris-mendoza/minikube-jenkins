export HTTP_NODE_PORT=$(kubectl get service --namespace ingress-nginx ingress-nginx-controller --output jsonpath="{.spec.ports[0].nodePort}")
export HTTPS_NODE_PORT=$(kubectl get service --namespace ingress-nginx ingress-nginx-controller --output jsonpath="{.spec.ports[1].nodePort}")
export NODE_IP="$(kubectl get nodes --output jsonpath="{.items[0].status.addresses[1].address}")"

echo "Visit http://${NODE_IP}:${HTTP_NODE_PORT} to access your application via HTTP."
echo "Visit https://${NODE_IP}:${HTTPS_NODE_PORT} to access your application via HTTPS."