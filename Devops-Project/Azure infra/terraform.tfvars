location = "Central India"

resource_group = {
  main = {
    name = "rg-devops-lab"
  }
}

vnet = {
  main = {
    name = "vnet-devops"
    address_space = [
      "10.0.0.0/16"
    ]
  }
}

subnets = {
  subnet1 = {
    name = "subnet-linux-01"

    address_prefixes = [
      "10.0.1.0/24"
    ]
  }

  subnet2 = {
    name = "subnet-linux-02"

    address_prefixes = [
      "10.0.2.0/24"
    ]
  }
}

nsgs = {
  nsg1 = {
    name = "nsg-linux-01"
  }

  nsg2 = {
    name = "nsg-linux-02"
  }
}

vms = {
  vm1 = {
    name       = "linux-vm-01"
    subnet_key = "subnet1"
    nsg_key    = "nsg1"
    vm_size    = "Standard_B2s"
  }

  vm2 = {
    name       = "linux-vm-02"
    subnet_key = "subnet2"
    nsg_key    = "nsg2"
    vm_size    = "Standard_B2s"
  }
}

admin_username = "azureuser"

ssh_public_key = "ssh-rsa YOUR_PUBLIC_KEY_HERE"
