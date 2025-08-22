variable "rg_name" { type = string }
variable "location" { type = string }
variable "vnet_name" { type = string }
variable "address_space" { type = list(string) }
variable "subnets" { type = map(object({ cidr = string })) }
variable "tags" { type = map(string) default = {} }
