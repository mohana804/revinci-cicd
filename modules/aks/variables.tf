variable "rg_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}

variable "cluster_name" {
  description = "Name of the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS API server."
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to deploy."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the AKS cluster and node pools will be deployed."
  type        = string
}

variable "system_node_count" {
  description = "Number of nodes in the system node pool."
  type        = number
}

variable "system_node_vm_size" {
  description = "VM size for the system node pool."
  type        = string
}

variable "user_node_count" {
  description = "Number of nodes in the user node pool."
  type        = number
}

variable "user_node_vm_size" {
  description = "VM size for the user node pool."
  type        = string
}

variable "tags" {
  description = "Map of tags to apply to resources."
  type        = map(string)
  default     = {}
}
