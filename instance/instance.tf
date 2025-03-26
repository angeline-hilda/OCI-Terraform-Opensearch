

################################
#  VM Instances based on count #
################################

resource "oci_core_instance" "vms" {
  count = var.instance_count

  // If no explicit AD number, spread instances on all ADs in round-robin. Looping to the first when last AD is reached
  availability_domain = local.AD
  compartment_id      = var.compute_compartment_id
  display_name        = "${var.display_name}-${count.index + 1}"
  shape               = var.shape
  fault_domain        = data.oci_identity_fault_domains.fds.fault_domains[count.index].name
  shape_config {
    memory_in_gbs             = var.memory_in_gbs
    ocpus                     = var.ocpus
  }
  create_vnic_details {
    subnet_id              = var.subnet_id
    display_name           = var.display_name
    assign_public_ip       = var.subnet_type == true ? false : true
    #nsg_ids     = var.nsg_id
  }

  source_details {
    source_type             = "image"
    source_id               = var.image_id
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
    #kms_key_id  = var.kms_key_id
  }
 metadata = {
  ssh_authorized_keys = var.ssh_authorized_keys
  #user_data = data.cloudinit_config.redis_setup.rendered

}
}


 
  