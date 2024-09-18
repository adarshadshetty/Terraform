# subnet_cidr_block = "10.0.40.0/24"
# vpc_cidr_block = "10.0.0.0/16"
# cidr_block = ["10.0.0.0/16","10.0.40.0/24"]
environment = "development"

// Object
cidr_block = [
    {cidr_block = "10.0.0.0/16", name = "dev-vpc"},
    {cidr_block="10.0.40.0/24",name="dev-subnet"}
    ]