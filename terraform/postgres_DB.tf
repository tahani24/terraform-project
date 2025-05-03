resource "azurerm_postgresql_server" "postgresql_server" {
  name                = var.postgres_server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.postgres_admin_username
  administrator_login_password = var.postgres_admin_password
  sku_name                     = "B_Gen5_1"
  version                      = "11"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  public_network_access_enabled = true
  ssl_enforcement_enabled      = false
  ssl_minimal_tls_version_enforced = "TLSEnforcementDisabled"

}

resource "azurerm_postgresql_database" "posgrs_db" {
  name                = var.postgres_db_name
  resource_group_name = var.resource_group_name
  server_name         = var.postgres_server_name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_firewall_rule" "allow_vm" {
  name                = "allow-vm"
  resource_group_name = var.resource_group_name
  server_name         = var.postgres_server_name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

