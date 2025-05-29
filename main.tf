resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "WestUS2"
}

resource "azurerm_monitor_metric_alert" "alert" {
  for_each                 = var.metricAlerts
  name                     = each.value.alertName
  resource_group_name      = azurerm_resource_group.main.name
  scopes = [
    # azurerm_monitor_workspace.main.id,
    data.azurerm_mysql_flexible_server.mysql[each.key].id,
    data.azurerm_kubernetes_cluster.main[each.key].id
  ]
  description              = each.value.alertDescription
  enabled                  = each.value.alertEnabled
  auto_mitigate            = each.value.alertAutoMitigate
  frequency                = each.value.alertFrequency
  target_resource_type     = each.value.alertTargetResourceType
  target_resource_location = each.value.alertTargetResourceLoc

  dynamic "criteria" {
    for_each = each.value.criteria 

    content {
      metric_namespace = criteria.value.metric_namespace
      metric_name      = criteria.value.metric_name 
      aggregation      = criteria.value.aggregation
      operator         = criteria.value.operator
      threshold        = criteria.value.threshold
    
      dynamic "dimension" {
        for_each = { for d in criteria.value.dimension : d.name => d }
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
    }

   }
}
