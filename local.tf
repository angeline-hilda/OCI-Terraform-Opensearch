

locals {
  shapes_config = [
    for i in data.oci_core_shapes.current_ad.shapes : {
      name          = i.name
      memory_in_gbs = i.memory_in_gbs
      ocpus         = i.ocpus
    }
  ]
  app_vm1_shape_is_flex = length(regexall("^*.Flex", var.app_vm1_shape)) > 0 # evaluates to boolean true when var.app_vm_shape contains .Flex

}

data "oci_core_shapes" "current_ad" {
  compartment_id = var.compartment_id
}


