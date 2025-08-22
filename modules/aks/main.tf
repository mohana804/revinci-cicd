terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix         = var.dns_prefix
  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name                 = "systemnp"
    node_count           = var.system_node_count
    vm_size              = var.system_node_vm_size
    type                 = "VirtualMachineScaleSets"
    orchestrator_version = var.kubernetes_version
    vnet_subnet_id       = var.subnet_id
    mode                 = "System"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }

  tags = var.tags
}

# User Node Pool
resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "usernp"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id

  vm_size              = var.user_node_vm_size
  node_count           = var.user_node_count
  mode                 = "User"
  vnet_subnet_id       = var.subnet_id
  orchestrator_version = var.kubernetes_version
}

# Outputs
output "kube_control_plane_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}
