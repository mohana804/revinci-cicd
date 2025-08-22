terraform {
  required_version = ">= 1.5.0"
  required_providers { azurerm = { source = "hashicorp/azurerm", version = ">= 3.90.0" } }
  backend "azurerm" {}
}
provider "azurerm" { features {} }
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-qa-tfstate"
    storage_account_name = "stqatfstate9k3a1"
    container_name       = "tfstate-qa"
    key                  = "vnet/qa.tfstate"
  }
}
module "aks" {
  source             = "../../../modules/aks"
  rg_name            = var.rg_name
  location           = var.location
  cluster_name       = var.cluster_name
  dns_prefix         = var.dns_prefix
  kubernetes_version = var.kubernetes_version
  subnet_id          = data.terraform_remote_state.vnet.outputs.subnet_ids["snet-aks"]
  system_node_count   = var.system_node_count
  system_node_vm_size = var.system_node_vm_size
  user_node_count     = var.user_node_count
  user_node_vm_size   = var.user_node_vm_size
  tags                = var.tags
}
