monitor_scoped_mysql = [
  {
    name           = "mysql-adt-platforms-01-a"
    resource_group = "mysql-wus2-adt-platforms-rg"
    location       = "westus2"
  },
  {
    name           = "mysql-np-flex-sbx-poc-03"
    resource_group = "rg-sbx-poc3-db"
    location       = "westus2"
  }
]


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
    alertName              = "appgwty-alert"
    alertScopes = ["/subscriptions/105294a7-6583-4501-b4e9-106e979d05e9/resourceGroups/testdekm/providers/Microsoft.DBforMySQL/flexibleServers/testdemoserver"]
    alertDescription           = "testdemo"
    alertEnabled               = "true"
    dynamic_criteria      = [
      {
        aggregation              = "Total"
        alert_sensitivity        = "High"
        evaluation_failure_count = 4
        evaluation_total_count   = 4
        ignore_data_before       = ""
        metric_name              = "BackendResponseStatus"
        metric_namespace         = "Microsoft.Network/applicationGateways"
        operator                 = "GreaterThan"
        skip_metric_validation   = false
        dimension = [
          {
          name     = "HttpStatusGroup"
          operator = "Include"
          values   = ["5xx"]
          }
        ]
      }
    ]
  }
}