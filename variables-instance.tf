
#============================================================================
#parameter for jump server
# -----------------------------------------------------------------------------
# compute  Variables - app vm (Jump server)
# -----------------------------------------------------------------------------

variable "app_vm1_instance_count" {
  description = "Application VM Instance Counnt"
  default     = "2"
}
variable "app_vm1_display_name" {
  description = "Application VM Display Name"
  default     = "app-vm"
}

variable "app_vm1_shape" {
  description = "Application VM Compute Shape"
}

variable "app_vm1_memory_in_gbs" {
  description = "Application VM Memory in GBs"
}

variable "app_vm1_ocpus" {
  description = "Application VM Compute in OCPUs"
}

variable "app_vm1_boot_volume_size" {
  description = "Application VM boot volume size in GBs"
}
variable "instance_display_name" {

}

variable "ssh_public_key" {

}
variable "ssh_private_key" {
  description = "Private key for SSH access"
  type        = string
  sensitive   = true
}
