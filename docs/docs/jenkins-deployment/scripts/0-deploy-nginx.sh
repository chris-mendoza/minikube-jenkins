#!/bin/bash

set -e
source ./config.sh

VALUES_TEMPLATE='charts/ingress-nginx/values.yml'

outputFile=$(mktemp)
valuesFile=$(mktemp)

trap 'rm -f ${outputFile} ${valuesFile}' EXIT

function usage(){
  echo "Usage: $0 [--delete] [-h|--help]"
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
     -h|--help)
      usage
      ;;
    --delete)
      delete=true
      shift
      ;;
    *)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

if [[ ${delete} == true ]]
then
  helm delete ${ingressNginxReleaseName} \
    --namespace ${ingressNginxNamespace}

else
  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
  helm repo update

  echo $ingressNginxServicePort

  helm upgrade ${ingressNginxReleaseName} ingress-nginx/ingress-nginx \
    --install \
    --create-namespace \
    --namespace ${ingressNginxNamespace} \
    --set controller.service.type=NodePort \
    --set controller.ingressClassResource.name=${ingressClassName} \
    --set controller.service.ports.http=${ingressNginxServicePort} \
    --set controller.replicaCount=1 \
    --values ${valuesFile}