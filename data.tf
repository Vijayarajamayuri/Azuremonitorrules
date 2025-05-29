data "azurerm_mysql_flexible_server" "mysql" {
  for_each            = { for mysql in var.monitor_scoped_mysql : mysql.name => mysql }
  name                = each.value.name
  resource_group_name = each.value.resource_group
}