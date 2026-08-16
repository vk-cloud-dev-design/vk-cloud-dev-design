module "resource_group" {
  source = "./modules/resource-group"

  for_each = var.resource_group

  name     = each.value.name
  location = var.location
}

module "vnet" {
  source = "./modules/vnet"

  for_each = var.vnet

  name                = each.value.name
  location            = var.location
  resource_group_name = module.resource_group["main"].name
  address_space       = each.value.address_space
}

module "subnet" {
  source = "./modules/subnet"

  subnets = var.subnets

  resource_group_name = module.resource_group["main"].name
  virtual_network_name = module.vnet["main"].name
}

module "nsg" {
  source = "./modules/nsg"

  for_each = var.nsgs

  name                = each.value.name
  location            = var.location
  resource_group_name = module.resource_group["main"].name
}

module "linux_vm" {
  source = "./modules/linux-vm"

  for_each = var.vms

  name                = each.value.name
  location            = var.location
  resource_group_name = module.resource_group["main"].name

  subnet_id = module.subnet.ids[each.value.subnet_key]

  vm_size = each.value.vm_size

  admin_username = var.admin_username
  ssh_public_key = var.ssh_public_key
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.vms

  subnet_id = module.subnet.ids[each.value.subnet_key]

  network_security_group_id = module.nsg[
    each.value.nsg_key
  ].id
}

module "public_ip" {
  source = "./modules/public-ip"

  name                = "pip-devops-lab"
  location            = var.location
  resource_group_name = module.resource_group["main"].name
}

module "load_balancer" {
  source = "./modules/load-balancer"

  name                = "lb-devops-lab"
  location            = var.location
  resource_group_name = module.resource_group["main"].name

  public_ip_id = module.public_ip.id

  nic_ids = {
    for key, vm in module.linux_vm :
    key => vm.nic_id
  }
}

output "resource_group" {
  value = module.resource_group["main"].name
}

output "vnet" {
  value = module.vnet["main"].name
}

output "public_ip" {
  value = module.public_ip.ip_address
}

output "vm_private_ips" {
  value = {
    for key, vm in module.linux_vm :
    key => vm.private_ip
  }
}

