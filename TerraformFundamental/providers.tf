terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"  // this is provider and install from this location.
      version = "5.67.0"
    }
  }
}

// provider is code that know how to talk to with aws. For this providers needs to be installed to available locally. Using terraform init command 
// terraform init
// .terraform folder downloaded after this command
// .terraform.lock.hcl file also downloaded after this. 