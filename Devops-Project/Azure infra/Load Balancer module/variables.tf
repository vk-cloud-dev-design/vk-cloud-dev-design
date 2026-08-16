variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "nic_ids" {
  type = map(string)
}
