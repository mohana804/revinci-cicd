variable "rg_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "List of address spaces for the Virtual Network."
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnets with CIDR blocks. Key = subnet name, Value = object with cidr."
  type = map(object({
    cidr = string
  }))
}

variable "tags" {
  description = "Map of tags to apply to resources."
  type        = map(string)
  default     = {}
}
