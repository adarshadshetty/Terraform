bucket_name = "dev-proj-1-remote-state-bucket-ada"
name        = "environment"
environment = "dev-1"

vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-proj-eu-central-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
eu_availability_zone = ["ap-south-1a", "ap-south-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/RbePVCloHi+FYoxAi0nWvk6mCKP7sZMbijDM63T6Fa1hvO7b/I0MRNmjdWaHnSuafJ0h4y4/UCDPnOWGOGL8zyxKdnsSr+Y181kbcPO3WAYvY1jOWkS/Ggfl08GOPM7iPlPzWpw5dATqLjJiHDFgrF3CZiBOTDJMRoxh8rEj71isoNy3rNVw0IMBYuEufM/Thql42TRvVqBCsScQQvLvJsdIzE6uqkFzThgrxjS4hFSCdp7AajZV1SW7lF0OExdrIXrHOSJVOMJtq3J2Q27HKLwnLypVhabN0q7AOS5Dd6J78iz0QSrwTW8k1yuCYm1mXsugTIdkb+jrpl7pg8SrQe8IM8X2c9ZvDxj56R9ilp6OSkAU/sp+yPGPuWHEa1gsEIe8SvRQECsWW/9LOJHunTjz7ccAHrStqQd9Rx7gPO3gg/48csq/jQET4Ii78oxU0pACIyluIz3zvhyfeCWEXpYbiG16azshakHsQlQGVn7VYVJS/IDFYtfZS/RizRQKo8JUlit8pkbA1UWbyjIZjAb+KwLVda8HL5DMYI1wpy1gRWDGthk0YmCExsRzr9k8Y0MmvBysffIcVxVSNN4CoyXdvdPVhWkr3UUAzxr5x4krO9jHJGZJfjOcm2j7Y5wjlZCgMlWkBIT6gYErUNiPiY3pUo0KygX8PIXn2/01fQ== adarshadshetty18@gmail.com"
ec2_ami_id = "ami-0522ab6e1ddcc7055"

ec2_user_data_install_apache = ""

domain_name = "jhooq.org"