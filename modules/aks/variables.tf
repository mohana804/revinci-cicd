variable "rg_name" { type = string }
variable "location" { type = string }
variable "cluster_name" { type = string }
variable "dns_prefix" { type = string }
variable "kubernetes_version" { type = string }
variable "subnet_id" { type = string }
variable "system_node_count" { type = number }
variable "system_node_vm_size" { type = string }
variable "user_node_count" { type = number }
variable "user_node_vm_size" { type = string }
variable "tags" { type = map(string) default = {} }
