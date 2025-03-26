

variable "db_subnet_compartment_id" {

}


variable "vcn_compartment_id" {

}
/*
variable "vcn_id" {

}
variable "db_subnet_id" {

}
*/

variable "opensearch_version" {

}

variable "opensearch_display_name" {

}
variable "maintenance_details_notification_email_ids" {
  type = list(string)

}

variable "master_user_name" {

}

variable "master_user_password" {

  description = "Contains a lowercase character, an uppercase character, number, a special character, Does not contain spaces,  at least 8 characters"

}

variable "master_node_host_type" {

  description = "Type of master node host: FLEX (Flexible) or BM (Bare Metal)"
  type        = string
  validation {
    condition     = contains(["FLEX", "BM"], var.master_node_host_type)
    error_message = "master_node_host_type must be either 'FLEX' or 'BM'."
  }
}

variable "data_node_host_type" {
  description = "Type of data node host: FLEX (Flexible) or BM (Bare Metal)"
  type        = string
  validation {
    condition     = contains(["FLEX", "BM"], var.data_node_host_type)
    error_message = "data_node_host_type must be either 'FLEX' or 'BM'."
  }
}


variable "data_node_count" {
  description = "Number of dedicated data nodes"
  type        = number
  validation {
    condition     = var.data_node_count >= 1 && var.data_node_count <= 10
    error_message = "Data node count must be between 1 and 10."
  }
}

variable "data_node_host_ocpu_count" {
  description = "OCPU count for data node"
  type        = number
  validation {
    condition     = var.data_node_host_ocpu_count >= 1 && var.data_node_host_ocpu_count <= 32
    error_message = "Data node OCPU must be between 1 and 32."
  }
}

variable "data_node_host_memory_gb" {
  description = "Memory (GB) for data node"
  type        = number
  validation {
    condition     = var.data_node_host_memory_gb >= 20 && var.data_node_host_memory_gb <= 1024
    error_message = "Data node memory must be between 20 GB and 1024 GB."
  }
}

variable "data_node_storage_gb" {
  description = "Storage (GB) for data node"
  type        = number
  validation {
    condition     = var.data_node_storage_gb >= 50 && var.data_node_storage_gb <= 314572
    error_message = "Data node storage must be between 50 GB and 314572 GB."
  }
}

variable "master_node_count" {
  description = "Number of dedicated leader (master) nodes"
  type        = number
  validation {
    condition     = var.master_node_count >= 1 && var.master_node_count <= 3
    error_message = "Leader node count must be between 1 and 3."
  }
}

variable "master_node_host_ocpu_count" {
  description = "OCPU count for leader node"
  type        = number
  validation {
    condition     = var.master_node_host_ocpu_count >= 1 && var.master_node_host_ocpu_count <= 32
    error_message = "Leader node OCPU must be between 1 and 32."
  }
}

variable "master_node_host_memory_gb" {
  description = "Memory (GB) for leader node"
  type        = number
  validation {
    condition     = var.master_node_host_memory_gb >= 20 && var.master_node_host_memory_gb <= 1024
    error_message = "Leader node memory must be between 20 GB and 1024 GB."
  }
}

variable "opendashboard_node_count" {
  description = "Number of OpenSearch Dashboard nodes"
  type        = number
  validation {
    condition     = var.opendashboard_node_count >= 1 && var.opendashboard_node_count <= 3
    error_message = "OpenSearch Dashboard node count must be between 1 and 3."
  }
}

variable "opendashboard_node_host_ocpu_count" {
  description = "OCPU count for OpenSearch Dashboard node"
  type        = number
  validation {
    condition     = var.opendashboard_node_host_ocpu_count >= 1 && var.opendashboard_node_host_ocpu_count <= 32
    error_message = "OpenSearch Dashboard OCPU must be between 1 and 32."
  }
}

variable "opendashboard_node_host_memory_gb" {
  description = "Memory (GB) for OpenSearch Dashboard node"
  type        = number
  validation {
    condition     = var.opendashboard_node_host_memory_gb >= 8 && var.opendashboard_node_host_memory_gb <= 1024
    error_message = "OpenSearch Dashboard memory must be between 8 GB and 1024 GB."
  }
}


variable "opensearch_cluster_security_mode" {
  description = "Security mode for the OpenSearch cluster. Options: DISABLED, PERMISSIVE, ENFORCING."
  type        = string
  default     = "ENFORCING"

  validation {
    condition     = contains(["DISABLED", "PERMISSIVE", "ENFORCING"], var.opensearch_cluster_security_mode)
    error_message = "Invalid security mode. Allowed values: DISABLED, PERMISSIVE, ENFORCING."
  }
}

variable "inbound_cluster_ids" { default = [] }
variable "reverse_connection_endpoint_customer_ips" { default = [] }

variable "outbound_cluster_is_enabled" {
  description = "Enable or disable outbound cluster configuration"
  type        = bool
  default     = false
}

variable "outbound_clusters" {
  description = "List of outbound clusters with their configurations"
  type = list(object({
    display_name        = string
    seed_cluster_id     = string
    is_skip_unavailable = bool
    mode                = string
    ping_schedule       = string
  }))
  default = []
}

/*
variable "defined_tags" { default = {} }
variable "freeform_tags" { default = {} }
variable "system_tags" { default = {} }

*/

/*
variable "master_node_host_bare_metal_shape" {
    description = "The bare metal shape for the cluster's master nodes."
  
}
variable "data_node_host_bare_metal_shape" {
    description = "The bare metal shape for the cluster's data nodes." 
}
*/






