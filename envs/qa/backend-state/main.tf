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

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sa_name" {
  type = string
}

variable "container_name" {
  type = string
}

resource "azurerm_resource_group" "tf" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "tf" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.tf.name
  location                 = azurerm_resource_group.tf.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }
  }
}

resource "azurerm_storage_container" "tf" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.tf.name
  container_access_type = "private"
}
