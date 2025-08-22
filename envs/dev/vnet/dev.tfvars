rg_name       = "rg-dev-net"
location      = "eastus"
vnet_name     = "vnet-dev"
address_space = ["10.20.0.0/16"]
subnets = {
  "snet-aks"     = { cidr = "10.20.1.0/24" }
  "snet-bastion" = { cidr = "10.20.2.0/24" }
}
tags = { env = "dev" }
