output "ids" {
  value = {
    for key, subnet in azurerm_subnet.this :
    key => subnet.id
  }
}

output "names" {
  value = {
    for key, subnet in azurerm_subnet.this :
    key => subnet.name
  }
}
