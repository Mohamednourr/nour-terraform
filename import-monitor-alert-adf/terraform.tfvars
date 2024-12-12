monitor_metric_alerts = {
  Nodes-Availability = {
    name        = "SHIR Nodes Availability"
    description = "this rule to to monitor the SHIR VMs which used as compute resources for data factory"
    criteria = {
      metric_namespace = "Microsoft.DataFactory/factories"
      metric_name      = "IntegrationRuntimeAvailableNodeNumber"
      aggregation      = "Total"
      operator         = "LessThan"
      threshold        = 2.0 #number of VMs that are a part of the intgeration runtime ADF pipelines
      dimensions = [
        {
          name     = "IntegrationRuntimeName"
          operator = "Include"
          values   = ["Intgeration Runtime"]
        }
      ]
    }
    severity = 1
  }

  Failure-of-any-pipeline = {
    name        = "Failure of any pipeline"
    description = ""
    criteria = {
      metric_namespace = "Microsoft.DataFactory/factories"
      metric_name      = "PipelineFailedRuns"
      aggregation      = "Total"
      operator         = "GreaterThan"
      threshold        = number
      dimensions       = null
    }
    severity = 2
  }
}