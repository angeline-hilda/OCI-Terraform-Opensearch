#module to describe network resources


module "jump_server" {
  source         = "./instance"
  instance_count = var.app_vm1_instance_count
  #availability_domain_number = var.availability_domain_number
  compute_compartment_id = var.compartment_id
  display_name           = var.instance_display_name
  shape                  = var.app_vm1_shape
  tenancy_ocid           = var.tenancy_id


  // If shape name contains ".Flex" and instance_flex inputs are not null, use instance_flex inputs values for shape_config block
  // Else use values from data.oci_core_shapes.current_ad for var.shape
  memory_in_gbs = local.app_vm1_shape_is_flex == true && var.app_vm1_memory_in_gbs != null ? var.app_vm1_memory_in_gbs : local.shapes_config[var.app_vm1_shape]["memory_in_gbs"]
  ocpus         = local.app_vm1_shape_is_flex == true && var.app_vm1_ocpus != null ? var.app_vm1_ocpus : local.shapes_config[var.app_vm1_shape]["ocpus"]

  subnet_id               = module.network.public_subnet_id
  subnet_type             = module.network.public_subnet_subnet_type
  boot_volume_size_in_gbs = var.app_vm1_boot_volume_size
  ssh_authorized_keys     = var.ssh_public_key
  ssh_private_key         = var.ssh_private_key

  #install_postgresql_client  = var.postresql_install
  #install_redis_cli = var.redis_install


  providers = {
    oci             = oci
    oci.home_region = oci.home_region
  }
}
