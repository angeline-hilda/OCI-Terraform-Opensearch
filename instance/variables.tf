variable "availability_domain_number" {
  description = "Availability Domain Number for VM"
  default = "1"
}
variable "tenancy_ocid" {
  description = "tenancy OCID"
}

variable "compute_compartment_id" {
  description = "Compartment where the resources will be created"
}
/*
variable "kms_key_id" {
  description = "KMS Key ID for Block Volume Encryption"
}
*/


#variable "nsg_id" {
 # description = "NSG IDs for the VM"
#}

variable "ssh_authorized_keys" {
  description = "SSH Public Key String"

}
variable "subnet_type" {
  description = "type of subnet"
}

#variable "bastion_id" {
 # description = "Bastion ID"
#}


variable "instance_count" {
  description = "Application VM Instance Counnt"
  default     = "1"
}
variable "display_name" {
  description = "Application VM Display Name"
  default     = "app-vm"
}
variable "shape" {
  description = "Application VM Compute Shape"
  default = "VM.Standard.E3.Flex"
}
variable "memory_in_gbs" {
  description = "Application VM Memory in GBs"
  default = "8"
}
variable "ocpus" {
  description = "Application VM Compute in OCPUs"
  default = "1"
}
variable "boot_volume_size_in_gbs" {
  description = "Application VM boot volume size in GBs"
  default = "50"
}
variable "subnet_id"{
  description = "subnet id"
}
#variable "app_nsg_display_name" {
#  description = "Application NSG Display Name"
#  default     = "APP_NSG"
#}

#variable "app_nsg_rules" {
#  type = map(
#    object(
#      {
#        protocol         = number
#        source_cidr      = string
#        source_type      = string
#        destination_port = string
#      }
#    )
#  )
#  default = {}
#}

variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "8"
}

variable "image_id" {
  #default = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaaxrshzeaugzedmq3j3shkwdolaziyb7wm76b5xe7l3effc46z5m3q"
 # default = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaa2zxahzljtf5h3iyfqiokrbv6zljram7sizfw3xpv4icmzi5rnruq"
 default = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaagwd3knk4oiisrqi7l34mevmhszo5c3sdxaux3hf6uptupnuqz4pa"
}

/*
variable "install_postgresql_client" {
  description = "Flag to install PostgreSQL client"
  type        = bool
  default     = false
}

variable "install_redis_cli" {
  description = "Flag to install Redis cli"
  type        = bool
  default     = false
  
}
*/
variable "ssh_private_key" {
  description = "Private key for SSH access"
  type        = string
  sensitive   = true
}
