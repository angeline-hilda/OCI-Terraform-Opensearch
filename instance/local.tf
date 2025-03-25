// Get all the Availability Domains for the region and default backup policies
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

locals {
  # For a single AD region, use the first availability domain
  AD = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

# Fetch fault domains in the single AD region
data "oci_identity_fault_domains" "fds" {
  availability_domain = local.AD
  compartment_id      = var.compute_compartment_id

  depends_on = [
    data.oci_identity_availability_domains.ads,
  ]
}

