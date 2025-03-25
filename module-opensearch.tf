
module "opensearch_cluster" {

  source         = "./opensearch"
  compartment_id = var.compartment_id

  opensearch_software_version = var.opensearch_version
  opensearch_display_name     = var.opensearch_display_name

  #Leader node
  master_node_host_type       = var.master_node_host_type
  master_node_count           = var.master_node_count
  master_node_host_memory_gb  = var.master_node_host_memory_gb
  master_node_host_ocpu_count = var.master_node_host_ocpu_count

  #data node
  data_node_host_type       = var.data_node_host_type
  data_node_count           = var.data_node_count
  data_node_host_memory_gb  = var.data_node_host_memory_gb
  data_node_host_ocpu_count = var.data_node_host_ocpu_count
  data_node_storage_gb      = var.data_node_storage_gb

  #opensearch dashboards
  opendashboard_node_count           = var.opendashboard_node_count
  opendashboard_node_host_memory_gb  = var.opendashboard_node_host_memory_gb
  opendashboard_node_host_ocpu_count = var.opendashboard_node_host_ocpu_count

  #networking 
  subnet_compartment_id = var.db_subnet_compartment_id
  subnet_id             = module.network.db_subnet_id
  vcn_compartment_id    = var.vcn_compartment_id
  vcn_id                = module.network.vcn_id


  maintenance_details_notification_email_ids = var.maintenance_details_notification_email_ids

  #security & Tags
  master_user_name     = var.master_user_name
  master_user_password = var.master_user_password

  opensearch_cluster_security_mode = var.opensearch_cluster_security_mode

  outbound_cluster_is_enabled = var.outbound_cluster_is_enabled
  outbound_clusters = var.outbound_clusters


  #master_node_host_bare_metal_shape = var.master_node_host_bare_metal_shape
  # system_tags = var.opensearch_cluster_system_tags
  # defined_tags = var.defined_tags
  # freeform_tags = var.freeform_tags



  providers = {
    oci             = oci
    oci.home_region = oci.home_region
  }

}