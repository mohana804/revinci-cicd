rg_name       = "rg-prod-net"
location      = "eastus"
vnet_name     = "vnet-prod"
address_space = ["10.40.0.0/16"]
subnets = {
  "snet-aks"     = { cidr = "10.40.1.0/24" }
  "snet-bastion" = { cidr = "10.40.2.0/24" }
}
tags = { env = "prod" }
