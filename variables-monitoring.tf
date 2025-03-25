

variable "destinations" {
  description = "A list of destinations for alarm notifications."
}

/*
variable "alarm_display_name" {
  type = string
}
*/


variable "alarm_namespace" {
  type = string
}
/*
variable "alarm_query" {
  type = string
}


variable "alarm_severity" {
  type = string
}
*/

variable "alarm_is_enabled" {
  type    = bool
  default = true
}

variable "alarm_summary" {
  type    = string
  default = "alarm triggered"
}

variable "alarm_body" {
  type    = string
  default = "The alarm has been triggered based on the query conditions."
}

variable "alarm_defined_tags" {
  type    = map(string)
  default = {}
}

variable "alarm_freeform_tags" {
  type    = map(string)
  default = {}
}

variable "alarm_message_format" {
  description = "The format to use for alarm notifications. - RAW, PRETTY_JSON, ONS_OPTIMIZED"
  type        = string
  default     = "RAW"
}

variable "alarm_resolution" {
  type        = string
  description = "The time between calculated aggregation windows for the alarm."
  default     = "1m"
}

variable "alarm_resource_group" {
  type    = string
  default = null
}

variable "alarm_pending_duration" {
  type    = string
  default = "PT5M"
}

variable "alarm_suppression_enabled" {
  type    = bool
  default = false

}



############################################ metrics  ######################################################

variable "cpu_utilization_alarm_threshold" {

}

variable "jvm_memory_pressure_alarm_threshold" {

}

variable "cluster_storage_alarm_threshold" {

}

variable "indexing_latency_alarm_threshold" {

}

variable "indexing_rate_alarm_threshold" {

}

variable "search_rate_alarm_threshold" {

}

variable "search_latency_alarm_threshold" {

}
