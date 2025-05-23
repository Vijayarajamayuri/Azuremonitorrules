actionGroups = {
  "group1" = {
     actionGroupName      = "AlertEscalationGroup"
     actionGroupShortName = "alertesc"
     actionGroupEnabled   = "true"
     actionGroupEmailReceiver = [
       {
         name                    = "example"
         email_address           = "example@gmail.com"
         use_common_alert_schema = "true"
        },
       {
         name                    = "test"
         email_address           = "test@gmail.com"
         use_common_alert_schema = "true"
       }
     ]
   },
  "group2" = {
     actionGroupName      = "AlertEscalationGroup"
     actionGroupShortName = "alertesc"
     actionGroupEnabled   = "true"
     actionGroupEmailReceiver = [
       {
         name                    = "example"
         email_address           = "example@gmail.com"
         use_common_alert_schema = "true"
        },
       {
         name                    = "test"
         email_address           = "test@gmail.com"
         use_common_alert_schema = "true"
       }
     ]
   }
}


activity_log_alert = {
  "mysql" = {
    alertname      = "mysqlrh"
    alertscopes    = ["/subscriptions/105294a7-6583-4501-b4e9-106e979d05e9"]
    description    = "ResourceHealth alerts for mysql"
    actionGroupID  = azurerm_monitor_action_group.group[1].id
    category       = "ResourceHealth"
    resourcetype = "Microsoft.DBForMySQL/servers"
  },
  "vm" = {
    alertname      = "vmrh"
    alertscopes    = ["/subscriptions/105294a7-6583-4501-b4e9-106e979d05e9"]
    description    = "ResourceHealth alerts for vm"
    actionGroupID  = azurerm_monitor_action_group.group[1].id
    category       = "ResourceHealth"
    resourcetype = "Microsoft.Compute/virtualMachines"
  },
  "appgtwy" = {
    alertname      = "app"
    alertscopes    = ["/subscriptions/105294a7-6583-4501-b4e9-106e979d05e9"]
    description    = "ResourceHealth alerts for appgtwy"
    category       = "ResourceHealth"
    resourcetype = "Microsoft.Network/applicationGateways"
  }
}

azure_subscription_id ="105294a7-6583-4501-b4e9-106e979d05e9"

metricAlerts = {
  "vm" = {
    alertName              = "vm-alert"
    alertScopes = ["/subscriptions/105294a7-6583-4501-b4e9-106e979d05e9/resourceGroups/wqdwdwq_group/providers/Microsoft.Compute/virtualMachines/wqdwdwq"]
    alertDescription           = "testdemo"
    alertEnabled               = "true"
    criteria      = [
      {
        aggregation            = "Average"
        metric_name            = "Percentage CPU"
        metric_namespace       = "Microsoft.Compute/virtualMachines"
        operator               = "GreaterThan"
        skip_metric_validation = false
        threshold              = 80
      },
      {
        aggregation            = "Average"
        metric_name            = "Available Memory Bytes"
        metric_namespace       = "Microsoft.Compute/virtualMachines"
        operator               = "LessThan"
        skip_metric_validation = false
        threshold              = 1000000000
      },
      {
        aggregation            = "Average"
        metric_name            = "OS Disk IOPS Consumed Percentage"
        metric_namespace       = "Microsoft.Compute/virtualMachines"
        operator               = "GreaterThan"
        skip_metric_validation = false
        threshold              = 95
      },
      {
        aggregation            = "Average"
        metric_name            = "VmAvailabilityMetric"
        metric_namespace       = "Microsoft.Compute/virtualMachines"
        operator               = "LessThan"
        skip_metric_validation = false
        threshold              = 1
    
      }
    ]
    alertAutoMitigate          = "true"
    alertFrequency             = "PT1M"
    alertTargetResourceType    = "Microsoft.Compute/virtualMachines"
    alertTargetResourceLoc     = "WestUS2"
  },
  "MYSQL" = {
    alertName              = "vm-alert"
    alertScopes = ["/subscriptions/105294a7-6583-4501-b4e9-106e979d05e9/resourceGroups/testdekm/providers/Microsoft.DBforMySQL/flexibleServers/testdemoserver"]
    alertDescription           = "testdemo"
    alertEnabled               = "true"
    criteria      = [
      {
        aggregation            = "Average"
        metric_name            = "active_connections"
        metric_namespace       = "Microsoft.DBforMySQL/flexibleServers"
        operator               = "GreaterThan"
        skip_metric_validation = false
        threshold              = 80
      },
      {
        aggregation            = "Average"
        metric_name            = "cpu_percent"
        metric_namespace       = "Microsoft.DBforMySQL/flexibleServers"
        operator               = "GreaterThan"
        skip_metric_validation = false
        threshold              = 95
      },
      {
        aggregation            = "Average"
        metric_name            = "io_consumption_percent"
        metric_namespace       = "Microsoft.DBforMySQL/flexibleServers"
        operator               = "GreaterThan"
        skip_metric_validation = false
        threshold              = 90
      }
    ]
    alertAutoMitigate          = "true"
    alertFrequency             = "PT1M"
    alertTargetResourceType    = "Microsoft.DBforMySQL/flexibleServers"
    alertTargetResourceLoc     = "WestUS2"
  },
  "AppGtwy" = {
    alertName              = "mysql-alert"
    alertScopes = ["/subscriptions/105294a7-6583-4501-b4e9-106e979d05e9/resourceGroups/testdekm/providers/Microsoft.DBforMySQL/flexibleServers/testdemoserver"]
    alertDescription           = "testdemo"
    alertEnabled               = "true"
    dynamic_criteria      = [
      {
        aggregation            = "Average"
        metric_name            = "active_connections"
        metric_namespace       = "Microsoft.DBforMySQL/flexibleServers"
        operator               = "GreaterThan"
        skip_metric_validation = false
        alert_sensitivity        = optional(string, "Medium")
        evaluation_total_count   = optional(number, 4)
        evaluation_failure_count = optional(number, 4)
        ignore_data_before       = optional(string)
        skip_metric_validation   = optional(bool, false)
        dimension = [
          {
          name = "value"
          operator = "value"
          values = [ "value" ]
          }
        ]
      }
    ]
  }


}






  # "alert2" = {
  #   alertName              = "testing-alert2"
  #   alertResourceGroupName = module.resource_group.resource_group_name
  #   alertScopes = [
  #     data.azurerm_kubernetes_cluster.example.id
  #   ]
  #   alertDescription           = ""
  #   alertEnabled               = "true"
  #   dynCriteriaMetricNamespace = "Microsoft.ContainerService/managedClusters"
  #     dynCriteriaMetricName      = "node_memory_working_set_percentage"
  #     dynCriteriaAggregation     = "Average"
  #     dynCriteriaOperator        = "GreaterThan"
  #     dynCriteriathreshold       = "1"
  #   alertAutoMitigate          = "true"
  #   alertFrequency             = "PT1M"
  #   alertTargetResourceType    = "Microsoft.ContainerService/managedClusters"
  #   alertTargetResourceLoc     = data.azurerm_kubernetes_cluster.example.location
  #   actionGroupID              = data.azurerm_monitor_action_group.example.id
  # }
# }




