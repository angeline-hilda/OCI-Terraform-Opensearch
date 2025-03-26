# general oci parameters

api_fingerprint      = "c2:d9:b9:45:05:1b:8d:64:0f:71:34:13:c9:86:21:12"
api_private_key_path = "/Users/anw/.oci/keys_t.pem"

home_region = "us-ashburn-1"
region      = "ap-mumbai-1"
tenancy_id  = "ocid1.tenancy.oc1..aaaaaaaalylrk6bjiuxqryukd6jrlxgfbwjuulnavxqehvv3crknt7ewhlpa"
user_id     = "ocid1.user.oc1..aaaaaaaatrqrjqypybmqqomamyyuzdjjclaws3fox4cz6v6cmxhlbfsdediq"


compartment_id = "ocid1.compartment.oc1..aaaaaaaazkbiglujngzerf6f2zi4uzfy6akurxhevpya7xvi6c7geoh4e6ka"


#======================== app vm parameters (jump server) ==================================
# The current configuration of this VM is:
# OS - Oracle Linux
# Linux Version 8
# image_id is set to the Region Sepcific OCID of the image
# you can find the list of images and the region specific OCID here: https://docs.oracle.com/en-us/iaas/images/oracle-linux-8x/oracle-linux-8-10-aarch64-2025-03-18-0.htm
# This ensures that the smae image us used very time when you run Terraform apply job


app_vm1_instance_count   = "1"
app_vm1_shape            = "VM.Standard.E4.Flex"
app_vm1_memory_in_gbs    = "8"
app_vm1_ocpus            = "1"
app_vm1_boot_volume_size = "50"

instance_display_name = "jump-server-2"
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxwuJlH1KehUYHIKp3K3Ret14YrLbW6W93+twHpDdzdJAF1kQhHQ9jntjR9a2E4tDsjIbAkwvx54poW9KjUWL8i4BgkeCUF1b21FZEEkzWiZK1k+1eBr8llgRK0Ate1/KnQ3mkpxXev8rF9Z3PEjwZnmHO3833ABD9PgL1sQqZZ8VtPlB4zeAtszcOAejY+AF+ZfX4o8s5gBSfYbbrHr0VQEYUPAPr4IHB5pO5UIGOLf7fx5gfreeunlLUlk+PtyfSgmMMZxvF5xdBayOg1YXoSYYzsOatxVub5hsz0DHF+7ZKlZgsN2mQfnhzsPr/JpDYl4ocLpDjXlp88VZTMdyX ssh-key-2024-05-13%"
#ssh_private_key = "-----BEGIN RSA PRIVATE KEY-----MIIEowIBAAKCAQEAscLiZR9SnoVGByCqdyt0XrdeGKy21ulvd/rcB6Q3c3SQBdZEIR0PY57Y0fWthOLQ7IyGwJML8eeKaFvSo1Fi/IuAYJHglBdW9tRWRBJM1omStZPtXga/JZYEStALXtfyp0N5pKcV3r/KxfWdzxI8GZ5hzt/N9wAQ/T4C9bEKmWfFbT5QeM3gLbM3DgHo2PgBfmX1+KPLOYAUn2G26x69FUBGFDwD6+CBweaTuVCBji3+38eYH63nrp5S1JZPj7cn0oJjDGcbxecXQWsjoNWF6EmGM7DmrcVbm+YbM9Axxfu2SpWYLDpkH54c7D6/yaQ2JeKHC6Q415afPFWUzHclwIDAQABAoIBAAjiaCVMtPjmSVM23z44hkbrnEDYdQT1wtP4zkF1hC35j+8yv9H13VyJxmVsBYGkQnPoLB3423p6K5E+sZ7nBO8BW+e3ssVEC10nzK33Si7YzmPT4mO2K5yJzGoezsqtOVwBw9UmYrHw3QYa2gnM7AMNxu6rgeRL9Q1rKYO1FwYGs7xdqnPwzuo3yfbq50iDKqgymrgNK6LN/guzZ/z0ANJSXtbXxzAYEl4bzA3mqz75yfZejBQMtt/WhGSBscE4XvjrkClVRTPTFSyRSA7K7IFD4kj3E8LyxLYdEz0FAv60p7U4Ms3Z1ab6QbZv3cdgi01dkDw/bscejkd6/tzKsoECgYEA8PfJ3OHJvCf0k/8+kMlDuVEj1eDOPGg89MYR96YnxKDDFtBDHzCfV9UyhCXtcGzD+WgAFRqjdlLMa8ZhtXY8/S1o6137XW2busTbXYp5Y8TxVtxAxLi+g3QZF5USwS5T5gIlGy+/kSEpa0xkIyuIMxJZUBz54KDetp7ghSAUNRcCgYEAvNmymYa9Q7ZwgXk4y/ko/qSBAiWtLPfSeWaLDYO5hLg8OXK9TBBOnA6wN+2FwbZ0dcQFEFF0WaJdPJhq5mLvHKvbcb/k4fADESvoeJcBkPzSfsKFw57vgJdEmroxOg/FAvoYZ5FOMCP/OKHXtZ1GY0CbV2/4x6nVdpy+r///RIECgYBSNriQvBhwMdGojPVzwLdyitSHLGQxB/+EI/ANZos68v6c0gGUqqoy9XJ+09HnAbT7axhcGvKadDV6r/y2RNkaKFwbsb0Ja1QurOuLRquT9qXA1PTkKYQWpY3KFfqIHp5RY3n1hJz/jyjqiu2/ciLOCfye8MPwd/KErEA+K2u5kQKBgQCNpmiNOYBa+sv2gXt1m2UBY1iUyLfVY+lOP/kK4QPVJe+eU47jL9QWv/mzaYiLXRSLhMUbkU1JMjznB5gfSJP7mHhYIMxIICPczGdplDKLkuc8RyHYMi2I8W129TOZTlzCt954SIgyGb4Et3g59EboiXw7IHSlJqFDf5yUHNtWgQKBgGC3wf/d7ximiGzXqlZ7LOd8h7Pa1p4orbkRZzSREZShDZFDCVUtrn3Yi4Q1PlYhiJVKdZ3bnVaOJWxBov51QtYeOP77WJMSVsoBlMr/jVachxVzj5pYvNiYUudttbJyRIGq4Ppu2NB+NGXB6gBivYnhKwQlnU380vfzlYdA2yhD-----END RSA PRIVATE KEY-----"
#vcn_display_name = "vcn-navi-test"
ssh_private_key = <<EOF
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAscLiZR9SnoVGByCqdyt0XrdeGKy21ulvd/rcB6Q3c3SQBdZE
IR0PY57Y0fWthOLQ7IyGwJML8eeKaFvSo1Fi/IuAYJHglBdW9tRWRBJM1omStZPt
Xga/JZYEStALXtfyp0N5pKcV3r/KxfWdzxI8GZ5hzt/N9wAQ/T4C9bEKmWfFbT5Q
eM3gLbM3DgHo2PgBfmX1+KPLOYAUn2G26x69FUBGFDwD6+CBweaTuVCBji3+38eY
H63nrp5S1JZPj7cn0oJjDGcbxecXQWsjoNWF6EmGM7DmrcVbm+YbM9Axxfu2SpWY
LDdpkH54c7D6/yaQ2JeKHC6Q415afPFWUzHclwIDAQABAoIBAAjiaCVMtPjmSVM2
3z44hkbrnEDYdQT1wtP4zkF1hC35j+8yv9H13VyJxmVsBYGkQnPoLB3423p6K5E+
sZ7nBO8BW+e3ssVEC10nzK33Si7YzmPT4mO2K5yJzGoezsqtOVwBw9UmYrHw3QYa
2gnM7AMNxu6rgeRL9Q1rKYO1FwYGs7xdqnPwzuo3yfbq50iDKqgymrgNK6LN/guz
Z/z0ANJSXtbXxzAYEl4bzA3mqz75yfZejBQMtt/WhGSBscE4XvjrkClVRTPTFSyR
SA7K7IFD4kj3E8LyxLYdEz0FAv60p7U4Ms3Z1ab6QbZv3cdgi01dkDw/bscejkd6
/tzKsoECgYEA8PfJ3OHJvCf0k/8+kMlDuVEj1eDOPGg89MYR96YnxKDDFtBDHzCf
V9UyhCXtcGzD+WgAFRqjdlLMa8ZhtXY8/S1o6137XW2busTbXYp5Y8TxVtxAxLi+
g3QZF5USwS5T5gIlGy+/kSEpa0xkIyuIMxJZUBz54KDetp7ghSAUNRcCgYEAvNmy
mYa9Q7ZwgXk4y/ko/qSBAiWtLPfSeWaLDYO5hLg8OXK9TBBOnA6wN+2FwbZ0dcQF
EFF0WaJdPJhq5mLvHKvbcb/k4fADESvoeJcBkPzSfsKFw57vgJdEmroxOg/FAvoY
Z5FOMCP/OKHXtZ1GY0CbV2/4x6nVdpy+r///RIECgYBSNriQvBhwMdGojPVzwLdy
itSHLGQxB/+EI/ANZos68v6c0gGUqqoy9XJ+09HnAbT7axhcGvKadDV6r/y2RNka
KFwbsb0Ja1QurOuLRquT9qXA1PTkKYQWpY3KFfqIHp5RY3n1hJz/jyjqiu2/ciLO
Cfye8MPwd/KErEA+K2u5kQKBgQCNpmiNOYBa+sv2gXt1m2UBY1iUyLfVY+lOP/kK
4QPVJe+eU47jL9QWv/mzaYiLXRSLhMUbkU1JMjznB5gfSJP7mHhYIMxIICPczGdp
lDKLkuc8RyHYMi2I8W129TOZTlzCt954SIgyGb4Et3g59EboiXw7IHSlJqFDf5yU
HNtWgQKBgGC3wf/d7ximiGzXqlZ7LOd8h7Pa1p4orbkRZzSREZShDZFDCVUtrn3Y
i4Q1PlYhiJVKdZ3bnVaOJWxBov51QtYeOP77WJMSVsoBlMr/jVachxVzj5pYvNiY
UudttbJyRIGq4Ppu2NB+NGXB6gBivYnhKwQlnU380vfzlYdA2yhD
-----END RSA PRIVATE KEY-----
EOF



###################################################################################################
#                         Virtual Cloud Network 
###################################################################################################

vcn1_vcn_display_name = "vcn2_VCN"
vcn1_vcn_dns_label    = "vcn2vcn"
vcn1_vcn_cidr_block   = ["10.0.0.0/16"]

# Subnet Configurations
public_subnet_cidr_block   = "10.0.1.0/24"
public_subnet_display_name = "PublicSubnet"
#public_subnet_dns_label = "publicsubnet"

db_subnet_cidr_block   = "10.0.2.0/24"
db_subnet_display_name = "DBSubnet"
#db_subnet_dns_label = "dbsubnet"

# Security List Configurations
public_ingress_rules = [
  { protocol = "6", source = "0.0.0.0/0", min = 22, max = 22 },     # SSH
  { protocol = "6", source = "0.0.0.0/0", min = 80, max = 80 },     # HTTP
  { protocol = "6", source = "0.0.0.0/0", min = 443, max = 443 },   # HTTPS
  { protocol = "6", source = "0.0.0.0/0", min = 5602, max = 5602 }, # OpenSearch Dashboard
  { protocol = "6", source = "0.0.0.0/0", min = 9200, max = 9200 }  # OpenSearch

]

#public_egress_rules = ["0.0.0.0/0"] # Allow all outbound traffic

db_ingress_rules = [
  { protocol = "6", source = "10.0.1.0/24", min = 22, max = 22 },        # SSH from Public Subnet
  { protocol = "6", source = "10.0.1.0/24", min = 3389, max = 3389 },    # RDP from Public Subnet
  { protocol = "1", source = "0.0.0.0/0", icmp_type = 3, icmp_code = 4 } # ICMP Ping
]

#db_egress_rules = ["0.0.0.0/0"] # Allow all outbound traffic

public_egress_rules = [
  {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
]

db_egress_rules = [
  {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
]


#############################################################################################
#                               OpenSearch Cluster
#############################################################################################


opensearch_version      = "2.3.0"
opensearch_display_name = "navi-opensearch-test"

# Cluster creation fails if the username is ADMIN
master_user_name     = "ANGEL"
master_user_password = "Welcome123##"


master_node_host_type       = "FLEX"
master_node_count           = 1
master_node_host_memory_gb  = 20
master_node_host_ocpu_count = 1

data_node_count           = 1
data_node_host_type       = "FLEX"
data_node_host_memory_gb  = 20
data_node_host_ocpu_count = 4
data_node_storage_gb      = 50

opendashboard_node_count           = 1
opendashboard_node_host_memory_gb  = 8
opendashboard_node_host_ocpu_count = 1

opensearch_cluster_security_mode = "ENFORCING"

maintenance_details_notification_email_ids = ["angeline.hilda.w@oracle.com"]
outbound_cluster_is_enabled                = false



#for cross cluster search
# Define multiple outbound clusters as a list of maps
/*
outbound_clusters = [
  {
    display_name       = "OutboundCluster1"
    seed_cluster_id    = "ocid1.opensearchcluster.oc1.ap-mumbai-1.amaaaaaazxsy2naayvs3ky2xlr7zjex24z7g7sbs2pb3u52iq33ozsrywd5q" # Replace with actual OCID
    is_skip_unavailable = false
    mode              = "SEARCH_AND_REPLICATION"  # Valid values: "SEARCH_ONLY", "REPLICATION_ONLY", "SEARCH_AND_REPLICATION"
    ping_schedule     = -1
  }
]

*/






##########################  NETWORK DETAILS ############################################################ 
db_subnet_compartment_id = "ocid1.compartment.oc1..aaaaaaaazkbiglujngzerf6f2zi4uzfy6akurxhevpya7xvi6c7geoh4e6ka"
#db_subnet_id             = "ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaafnamnnevgt7iua5t4k7fstrxzfxbnvtl7s25ynyohqobf2adx2va"
vcn_compartment_id = "ocid1.compartment.oc1..aaaaaaaazkbiglujngzerf6f2zi4uzfy6akurxhevpya7xvi6c7geoh4e6ka"
#vcn_id                   = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaazxsy2naarvz4jye6vfr2wzob6tbfrrn7qg7xeu7bujn3uvlizyta"


######################### TAGS ##################################################
#defined_tags                   = { "Environment" = "Production" }
#freeform_tags                  = { "Project" = "Search" }
#system_tags                    ={}


######################### ALARMS #######################################

#########################  Alarms      #######################################
#alarm_namespace for opensearch is oci_opensearch
#resourceId is the OCID of the resource that was scanned

# Refer this for other opensearch Metrics: https://docs.oracle.com/en-us/iaas/Content/search-opensearch/ociopensearchmetrics.htm





alarm_namespace = "oci_opensearch"
destinations    = ["ocid1.onstopic.oc1.ap-mumbai-1.amaaaaaazxsy2naawr2tssmbtwrktwfxl7ymiepcrhqbbhebcioelbkyruoa"]

alarm_pending_duration = "PT1M"
alarm_message_format   = "ONS_OPTIMIZED"


#metrics

cpu_utilization_alarm_threshold     = 80
jvm_memory_pressure_alarm_threshold = 75
cluster_storage_alarm_threshold     = 500
indexing_latency_alarm_threshold    = 500
indexing_rate_alarm_threshold       = 100
search_rate_alarm_threshold         = 100
search_latency_alarm_threshold      = 500