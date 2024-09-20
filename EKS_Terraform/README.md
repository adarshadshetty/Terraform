
# Automate creation of EKS cluster using Terraform.
<div align="center">
  <img src="./public/projectOverview.png" alt="Logo" width="50%" height="50%">
</div>

## Cluster Service needs to be created.
<div align="center">
  <img src="./public/EKS-Cluster-services.png" alt="Logo" width="50%" height="50%">
</div>

- we need something like CloudFormation template

-> When your using module run 'terraform init'


##### Pre-Requisites
1. AWS CLI installed
2. kubectl installed
3. aws-iam-authenticator installed

```
aws eks update-kubeconfig --name myapp-eks-cluster --region eu-central-1
```

```
kubectl get nodes
```

```
kubectl apply
```

## Best Practices of Subnet and VPC

<div align="center">
  <img src="./public/BestPractices.png" alt="Logo" width="50%" height="50%">
</div>

## EKS cluster is created.
<div align="center">
  <img src="./public/eks-cluster.png" alt="Logo" width="100%" height="25%">
</div>

## Node-Group Created.
<div align="center">
  <img src="./public/node-gropu.png" alt="Logo" width="100%" height="25%">
</div>

## Note of Public and Private
<div align="center">
  <img src="./public/publicprivatesubnet.png" alt="Logo" width="30%" height="30%">
</div>

## How values are passed from module.
<div align="center">
  <img src="./public/reference.png" alt="Logo" width="20%" height="20%">
</div>