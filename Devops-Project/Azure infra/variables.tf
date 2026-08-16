variable "location" {
  type    = string
  default = "Central India"
}

variable "resource_group" {
  type = map(object({
    name = string
  }))
}

variable "vnet" {
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "nsgs" {
  type = map(object({
    name = string
  }))
}

variable "vms" {
  type = map(object({
    name       = string
    subnet_key = string
    nsg_key    = string
    vm_size    = string
  }))
}

variable "admin_username" {
  type = string
}

variable "ssh_public_key" {
  type = string
}
