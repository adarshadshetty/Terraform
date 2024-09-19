#### Project Overview
<div align="center">
  <img src="./public/ProjectOverview.png" alt="Logo" width="50%" height="50%">
</div>
1. Provision an EC2 Instance on AWS infrastructure
2. Run nginx Docker container on EC2 Insance

## Before this Provision AWS infrastructure for it.

1. Create custom VPC
2. Create custom Subnet
3. Create Route Table & Internet Gateway
4. Provision EC2 Instance
5. Deploy nginx Docker container
6. Create SG (firewall)

#### Project Steps
<div align="center">
  <img src="./public/projectSteps.png" alt="Logo" width="50%" height="50%">
</div>


###### (AWS create default route table when we are creating vpc)

```
terraform state show aws_vpc.myapp-vpc
```

