resource "azurerm_monitor_metric_alert" "these" {
  for_each            = var.monitor_metric_alerts
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.this.name
  scopes              = ["ADF_ID"]
  description         = each.value.description

  criteria {
    metric_namespace = each.value.criteria.metric_namespace
    metric_name      = each.value.criteria.metric_name
    aggregation      = each.value.criteria.aggregation
    operator         = each.value.criteria.operator
    threshold        = each.value.criteria.threshold

    dynamic "dimension" {
      for_each = each.value.criteria.dimensions != null ? tomap({ for i, d in each.value.criteria.dimensions : i => d }) : {}
      content {
        name     = dimension.value.name
        operator = dimension.value.operator
        values   = dimension.value.values
      }
    }
  }

  severity = each.value.severity

  action {
    action_group_id = "GROUP_ID"
  }
}

import {
  to = azurerm_monitor_metric_alert.this["Nodes-Availability"]
  id = "ID"
}

import {
  to = azurerm_monitor_metric_alert.this["Failure-of-any-pipeline"]
  id = "ID"
}