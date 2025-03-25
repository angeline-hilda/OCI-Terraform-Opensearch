resource "oci_opensearch_opensearch_cluster" "test_opensearch_cluster" {
    #Required
    compartment_id = var.compartment_id

    data_node_count = var.data_node_count
    data_node_host_memory_gb = var.data_node_host_memory_gb
    data_node_host_ocpu_count = var.data_node_host_ocpu_count
    data_node_storage_gb = var.data_node_storage_gb

    data_node_host_type = var.data_node_host_type
    
    display_name = var.opensearch_display_name
    
    master_node_count = var.master_node_count
    master_node_host_memory_gb = var.master_node_host_memory_gb
    master_node_host_ocpu_count = var.master_node_host_ocpu_count
    
    master_node_host_type = var.master_node_host_type
    
    opendashboard_node_count = var.opendashboard_node_count
    opendashboard_node_host_memory_gb = var.opendashboard_node_host_memory_gb
    opendashboard_node_host_ocpu_count = var.opendashboard_node_host_ocpu_count
    
    software_version = var.opensearch_software_version
    
    subnet_compartment_id = var.subnet_compartment_id
    subnet_id = var.subnet_id
    vcn_compartment_id = var.vcn_compartment_id
    vcn_id = var.vcn_id

 
   
    inbound_cluster_ids = var.inbound_cluster_ids
    
    maintenance_details {

        #Optional
        notification_email_ids = var.maintenance_details_notification_email_ids
    }
    dynamic "outbound_cluster_config" {
        for_each = var.outbound_cluster_is_enabled ? [1] : []
        content {
             is_enabled = var.outbound_cluster_is_enabled

             dynamic "outbound_clusters" {
             for_each = var.outbound_clusters # List of maps (each map represents a cluster)
            content {
             display_name       = outbound_clusters.value["display_name"]
             seed_cluster_id    = outbound_clusters.value["seed_cluster_id"]
            is_skip_unavailable = outbound_clusters.value["is_skip_unavailable"]
            mode              = outbound_clusters.value["mode"]
            ping_schedule     = outbound_clusters.value["ping_schedule"]
      }
    }
  }
}
    
    
    reverse_connection_endpoint_customer_ips = var.reverse_connection_endpoint_customer_ips
    
    security_master_user_name = var.master_user_name
    security_master_user_password_hash = var.master_user_password
    
    security_mode = var.opensearch_cluster_security_mode
    
    #Optional
    
    # data_node_host_bare_metal_shape = var.data_node_host_bare_metal_shape
    # master_node_host_bare_metal_shape = var.master_node_host_bare_metal_shape
   # system_tags = var.opensearch_cluster_system_tags
   # defined_tags = var.defined_tags
   # freeform_tags = var.freeform_tags
}