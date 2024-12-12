variable "monitor_metric_alerts" {
  type = map(object({
    name        = string
    description = string
    criteria = object({
      metric_namespace = string
      metric_name      = string
      aggregation      = string
      operator         = string
      threshold        = number
      dimensions = optional(list(object({
        name     = string
        operator = string
        values   = list(string)
      })))
    })
    severity = number
  }))
}