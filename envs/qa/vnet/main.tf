terraform {
  required_version = ">= 1.5.0"
  required_providers { azurerm = { source = "hashicorp/azurerm", version = ">= 3.90.0" } }
  backend "azurerm" {}
}
provider "azurerm" { features {} }
module "vnet" {
  source        = "../../../modules/vnet"
  rg_name       = var.rg_name
  location      = var.location
  vnet_name     = var.vnet_name
  address_space = var.address_space
  subnets       = var.subnets
  tags          = var.tags
}
output "subnet_ids" { value = module.vnet.subnet_ids }
output "vnet_id"    { value = module.vnet.vnet_id }
