# Automate creation of EKS cluster using Terraform.

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
``

```
kubectl apply