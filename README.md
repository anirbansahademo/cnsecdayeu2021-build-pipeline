# cnsecdayeu2021-build-pipeline

Steps to set up the infrastructure (AWS used for the demonstration)

1. Create a Kubernetes cluster in a VPC (Kubernetes 1.19 used here)

2. Set up the Nginx Ingress controller in the K8S cluster (https://kubernetes.github.io/ingress-nginx/deploy/#aws)

3. Create a Harbor installation - https://goharbor.io/docs/2.2.0/install-config/harbor-ha-helm/ (The default HELM chart works readily, edit the Ingress section to access the dashboard)

4. Install Tekton components (pipeline, trigger and dashboard). Create an ingress to point to the Tekton dashboard service and expose the dashboard (just for visibility). For our demo, we will use the argocd namespace to deploy our tekton pipelines, so the dashboard and trigger is not needed for the purpose of this demo.
```
kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.22.0/release.yaml
kubectl apply -f https://storage.googleapis.com/tekton-releases/triggers/previous/v0.12.1/release.yaml
kubectl apply -f https://storage.googleapis.com/tekton-releases/dashboard/previous/v0.15.0/tekton-dashboard-release.yaml
```

5. Install ArgoCD (Create ingress for endpoint https://argoproj.github.io/argo-cd/operator-manual/ingress/)
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v1.7.14/manifests/install.yaml
```
