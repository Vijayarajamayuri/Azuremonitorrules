locals {
  criteria      = {
    "Percentage CPU" = {
    aggregation            = "Average"
    metric_namespace       = "Microsoft.Compute/virtualMachines"
    operator               = "GreaterThan"
    skip_metric_validation = false
    threshold              = 80
    },
    "Available Memory Bytes" = {
    aggregation            = "Average"
    metric_namespace       = "Microsoft.Compute/virtualMachines"
    operator               = "LessThan"
    skip_metric_validation = false
    threshold              = 1000000000       
    }
  }
}