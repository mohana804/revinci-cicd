rg_name       = "rg-qa-net"
location      = "eastus"
vnet_name     = "vnet-qa"
address_space = ["10.30.0.0/16"]
subnets = {
  "snet-aks"     = { cidr = "10.30.1.0/24" }
  "snet-bastion" = { cidr = "10.30.2.0/24" }
}
tags = { env = "qa" }
