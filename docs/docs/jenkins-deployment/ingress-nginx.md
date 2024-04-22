## Configure Ingress Nginx

After configuring Minikube, we will be configuring the Ingress Nginx module to pass traffic to our Jenkins Deployment.

### Environment Variables

```bash
#Environment Variables
environment="prod"
name="jenkins"
version="1.0.0"

#Nginx Ingress Environment Variables
ingressNginxNamespace="ingress-nginx"
ingressNginxReleaseName="ingress-nginx"
ingressNginxServicePort=8000
ingressClassName="nginx"
```