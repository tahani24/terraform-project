output "VM_public_ip_address" {
  value = azurerm_public_ip.new_vm_ip.ip_address
}
output "vmss_gateway_public_ip" {
  description = "Public IP of the gateway into VMSS application "
  value       = azurerm_public_ip.appgw_public_ip.ip_address
}
output "postgresql_server_name" {
  description = "PostgreSQL server name"
  value       = azurerm_postgresql_server.postgresql_server.name
}
output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.storage_account.name
}