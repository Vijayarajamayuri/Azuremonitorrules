variable "metricAlerts" {
  type = map(object({
    alertName                  = string
    # alertScopes                = list(string)
    alertDescription           = string
    alertEnabled               = bool
    alertAutoMitigate          = bool
    alertFrequency             = string
    alertTargetResourceType    = string
    alertTargetResourceLoc     = string
    criteria = optional(list(object({
      metric_namespace       = string
      metric_name            = string
      aggregation            = string
      operator               = string
      threshold              = number
      skip_metric_validation = optional(bool, false)
      dimension = optional(list(object({
        name     = string
        operator = optional(string, "Include")
        values   = list(string)
      })), [])
    })), [])
  }))
  default = {}
}


variable "monitor_scoped_mysql" {
  description = "List of MySQL servers to be monitored"
  type = list(object({
    name           = string
    resource_group = string
    location       = string
  }))
  default = []
}