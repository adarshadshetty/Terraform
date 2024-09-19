vpc_cidr_block =  "10.0.0.0/16"
subnet_cidr_block = "10.0.10.0/24"
avail_zone     = "ap-south-1a"
env_prefix     = "dev"
my_ip = "0.0.0.0/0"               
instance_type = "t2.micro" 

// my_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNlBGeVqaezdYUuT2rCLJHvdRQtsgDGZuX/B8DFI2jQT5HO+As+VJydE7aic7TZMFwr6EgB0p3SOGzCSmA9KUPvQij8I+MJgynr1nlbVWyuGaKdZXblIMKpCTS3cUi3+JaJIfJcJqkSiTuaZYV2QLbUPlKOUejL7F4iUsV4ugzB2OZAGTdegEXSJpuKtGrMVJBFM/RcvSb599A3y45iIkBocpceRQmKS6QgLR588dDF+2+tsVsdcZGNRjA3QjuJMRIQjWrpIRutjcZR93sjW/fBkl/+687KZU3vh5Oh8pelOGhGkfUdvB5EoLG5blaznPnO7MokaANfJ4XGiwua65L6Ds1WiPZauT+vtHUbL1tHBMrrKaCN2ZjZX/ZdVzrC5BSLOpu9xJBbaVz5CNuglSK8SOdmoaoqks3WhFEjoWeRFfQgaGnKW5u7isifYpDaLk1Nz0x6PuWEG4kfcu4n1CMpCHxKUQoJUPW9SRkul1KVrf/xnH/dypnbTaKl3rDbx0= HP@ADARSHA-D-SHETTY"

public_key_location =  "C:/Users/HP/.ssh/id_rsa.pub"

// icacls "C:\Users\HP\.ssh\id_rsa.pub" /grant HP:R   (Set the execution permission in CMD Not work in GIT BASH)
// ssh -i ~/.ssh/id_rsa ec2-user@43.205.103.181
// ssh ec2-user@43.205.103.181
