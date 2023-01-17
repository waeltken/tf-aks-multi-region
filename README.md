# AKS Multiregion PoC

## Create AKS Cluster

```zsh
terraform init
terraform apply

az aks get-credentials -g aks-westeurope-rg -n aks-westeurope
```
