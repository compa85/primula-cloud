---
apiVersion: v1
kind: Namespace
metadata:
  name: external-secrets
---
apiVersion: v1
kind: Secret
metadata:
  name: onepassword-secret
  namespace: external-secrets
stringData:
  token: "op://Kubernetes/1password/token"
---
apiVersion: v1
kind: Namespace
metadata:
  name: flux-system
---
apiVersion: v1
kind: Secret
metadata:
  name: sops-age-secret
  namespace: flux-system
stringData:
  age.agekey: "op://Kubernetes/sops/private-key"
---
apiVersion: v1
kind: Secret
metadata:
  name: flux-system
  namespace: flux-system
stringData:
  githubAppID: "op://Kubernetes/github-app/app-id"
  githubAppInstallationID: "op://Kubernetes/github-app/installation-id"
data:
  githubAppPrivateKey: op://Kubernetes/github-app/private-key-base64
---
apiVersion: v1
kind: Secret
metadata:
  name: cluster-secrets
  namespace: flux-system
stringData:
  SECRET_DOMAIN: "op://Kubernetes/cluster/domain"
