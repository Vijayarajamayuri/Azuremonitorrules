
variable "metricAlerts" {
  type = map(object({
    alertName                  = string
    alertScopes                = list(string)
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
    dynamic_criteria = optional(list(object({
      metric_namespace         = string
      metric_name              = string
      aggregation              = string
      operator                 = string
      alert_sensitivity        = optional(string, "Medium")
      evaluation_total_count   = optional(number, 4)
      evaluation_failure_count = optional(number, 4)
      ignore_data_before       = optional(string)
      skip_metric_validation   = optional(bool, false)
      dimension = optional(list(object({
        name     = string
        operator = optional(string, "Include")
        values   = list(string)
      })), [])
    })), [])
  }))
  default = {}
}



