# Define local variables for OpenSearch alarms
locals {
  opensearch_metrics = {
    "CPU Utilization" = {
      query    = format("CpuUtilization[5m]{resourceId = \"%s\"}.percentile(0.5) > %s", module.opensearch_cluster.opensearch_id, var.cpu_utilization_alarm_threshold)
      severity = "CRITICAL"
      summary  = "CPU Utilization exceeded."
    }
    "JVM Memory Pressure" = {
      query    = format("JVMMemoryPressure[5m]{resourceId = \"%s\"}.percentile(0.5) > %s", module.opensearch_cluster.opensearch_id, var.jvm_memory_pressure_alarm_threshold)
      severity = "CRITICAL"
      summary  = "JVM Memory Pressure exceeded."
    }
    "Current Cluster Storage" = {
      query    = format("CurrentClusterStorage[5m]{resourceId = \"%s\"}.mean() > %s", module.opensearch_cluster.opensearch_id, var.cluster_storage_alarm_threshold)
      severity = "WARNING"
      summary  = "Cluster storage usage exceeded."
    }
    "Indexing Rate" = {
      query    = format("IndexingRate[5m]{resourceId = \"%s\"}.rate() < %s", module.opensearch_cluster.opensearch_id, var.indexing_rate_alarm_threshold)
      severity = "WARNING"
      summary  = "Indexing rate is below expected threshold."
    }
    "Search Rate" = {
      query    = format("SearchRate[5m]{resourceId = \"%s\"}.rate() < %s", module.opensearch_cluster.opensearch_id, var.search_rate_alarm_threshold)
      severity = "WARNING"
      summary  = "Search rate is below expected threshold."
    }
    "Indexing Latency" = {
      query    = format("IndexingLatency[5m]{resourceId = \"%s\"}.mean() > %s", module.opensearch_cluster.opensearch_id, var.indexing_latency_alarm_threshold)
      severity = "WARNING"
      summary  = "Indexing latency is too high."
    }
    "Search Latency" = {
      query    = format("SearchLatency[5m]{resourceId = \"%s\"}.mean() > %s", module.opensearch_cluster.opensearch_id, var.search_latency_alarm_threshold)
      severity = "WARNING"
      summary  = "Search latency is too high."
    }
  }
}



module "oci_opensearch_monitoring" {

    depends_on = [ module.opensearch_cluster ]

  for_each = local.opensearch_metrics

  source = "./monitoring"
  compartment_id            = var.compartment_id
  destinations              = var.destinations
  alarm_display_name = "${var.opensearch_display_name }-${each.key}"

  alarm_is_enabled = var.alarm_is_enabled
  alarm_metric_compartment_id     = var.compartment_id
  alarm_namespace = var.alarm_namespace
  alarm_query = each.value.query
  alarm_severity = each.value.severity

  # Optional parameters
  alarm_summary     = each.value.summary
  alarm_body         = "Alert: ${each.key} crossed threshold."
  #defined_tags      = var.alarm_defined_tags
  #freeform_tags     = var.alarm_freeform_tags
  alarm_message_format    = var.alarm_message_format
  alarm_resolution        = var.alarm_resolution
  alarm_resource_group    = var.alarm_resource_group
  alarm_pending_duration  = var.alarm_pending_duration
  alarm_suppression_enabled = var.alarm_suppression_enabled
  
  providers = {
    oci             = oci
    oci.home_region = oci.home_region
  }
  
}