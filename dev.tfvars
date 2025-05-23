metricAlerts = {
  "AppGtwy" = {
    alertName              = "appgwty-alert"
    alertScopes = ["/subscriptions/105294a7-6583-4501-b4e9-106e979d05e9/resourceGroups/test/providers/Microsoft.Network/applicationGateways/appgtwy"]
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
      },
      {

        aggregation              = "Average"
        alert_sensitivity        = "High"
        evaluation_failure_count = 4
        evaluation_total_count   = 4
        ignore_data_before       = ""
        metric_name              = "UnhealthyHostCount"
        metric_namespace         = "Microsoft.Network/applicationGateways"
        operator                 = "GreaterThan"
        skip_metric_validation   = false
      }

    ]
  }
}

