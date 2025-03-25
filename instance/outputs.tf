# Outputs
output "vm_compute_id" {
  value = oci_core_instance.vms.*.id
}

output "vm_private_ip" {
  value = oci_core_instance.vms.*.private_ip
}
