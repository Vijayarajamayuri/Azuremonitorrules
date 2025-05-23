resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "WestUS2"
}


resource "azurerm_monitor_metric_alert" "alert" {
  for_each                 = var.metricAlerts
  name                     = each.value.alertName
  resource_group_name      = azurerm_resource_group.example.name
  scopes                   = each.value.alertScopes
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
  dynamic "dynamic_criteria" {
    for_each = each.value.dynamic_criteria
    content {
      metric_namespace = dynamic_criteria.value.metric_namespace
      metric_name      = dynamic_criteria.value.metric_name

      aggregation = dynamic_criteria.value.aggregation
      operator    = dynamic_criteria.value.operator

      alert_sensitivity        = dynamic_criteria.value.alert_sensitivity
      evaluation_total_count   = dynamic_criteria.value.evaluation_total_count
      evaluation_failure_count = dynamic_criteria.value.evaluation_failure_count
      ignore_data_before       = dynamic_criteria.value.ignore_data_before

      skip_metric_validation = dynamic_criteria.value.skip_metric_validation

      dynamic "dimension" {
        for_each = dynamic_criteria.value.dimension
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
    }
  }
}
