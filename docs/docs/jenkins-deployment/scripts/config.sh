#!/bin/bash

#Environment Variables
environment="prod"
name="jenkins"
version="1.0.0"

#Nginx Ingress Environment Variables
ingressNginxNamespace="ingress-nginx"
ingressNginxReleaseName="ingress-nginx"
ingressNginxServicePort=8000
ingressClassName="nginx"

#Jenkins Environment Variables
jenkinsReleaseName="jenkins"
jenkinsControllerNamespace="jenkins-controller"
jenkinsPersistentVolumeClaim="jenkins-pv-claim"
jenkinsControllerServiceAccountName="jenkins-admin"
jenkinsHost="jenkins.waffles.nfs"
jenkinsHostPrivate="jenkins.internal.waffles.nfs"
jenkinsUrlPath="/"