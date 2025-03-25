# Oracle Cloud Infrastructure (OCI) Terraform Module for OCI Search Service with OpenSearch

This OpenTofu/Teraform module provisions and configures OCI Search with OpenSearch. It provisions an OpenSearch Cluster, configures nodes, sets up networking and monitoring and alarms service.

## Pre-requisites
Ensure you have the following before using this module:
- [OpenTofu](https://opentofu.org/docs/intro/install/) or [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) installed
- An Oracle Cloud Infrastruture(OCI) Account
- [Configure OCI CLI](https://docs.oracle.com/en-us/iaas/Content/dev/terraform/tutorials/tf-provider.htm#prepare) with appropriate credentials
- Required [IAM policies](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/ocisearchpermissions.htm)


## Using with Terraform

This module is compatible with OpenTofu. To use Terraform instead of OpenTofu, ensure you have Terraform installed and use the following provider configuration:

```hcl

terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = ">= 6.31.0"
    }
  }
}

```

## Deploy using OpenTofu or Terraform

1. Use `terraform.tfvars` File

   The repository includes a terraform.tfvars.example file. Edit it and replace the placeholder values with your actual OCI credentials, to create your own terraform.tfvars file.
   
3. To deploy the resources, initialize and apply the configuration:

```sh
tofu init  # or terraform init
tofu plan  # or terraform plan
tofu apply # or terraform apply
```

## Cleanup
To destroy the created resources, use:

```sh
tofu destroy # or terraform destroy
```

## Connect to OCI Search Service
1. SSH into the Jump Server

```
ssh -i <ssh-privatekey> opc@<jumpserver-public-ip>
```
2. Run one of the following commands

```
curl https://<opensearch-cluster-endpoint>:9200 -u username:password
```


```
curl https://<openserach-private-ip>:9200 --insecure -u username:password
```

## Connect to OpenSearch Dashboards
1. From your local machine, through port forwarding.  Open a new Terminal window and run the following command:

```
ssh -C -v -t -L 127.0.0.1:5601:<opensearch-dashboard-private-ip>:5601 -L 127.0.0.1:9200:<opensearch-private-ip>:9200 opc@<jumpserver-public-ip> -i <ssh-private-key>
```

2. Access https://localhost:5601 from your browser.

## Documentation
- [OCI Search with OpenSearch](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/Concepts/ociopensearch.htm#ociopensearch)
- [Search and Visualize data using OCI Search with OpenSearch](https://docs.oracle.com/en/learn/oci-opensearch/index.html#introduction)
- [OCI Monitoring](https://docs.oracle.com/en-us/iaas/Content/Monitoring/Concepts/monitoringoverview.htm)
- [OCI Notifications](https://docs.oracle.com/en-us/iaas/Content/Notification/Concepts/notificationoverview.htm)
- [OpenSearch Cluster Metrics](https://docs.oracle.com/en-us/iaas/Content/search-opensearch/ociopensearchmetrics.htm)
- [MQL Reference](https://docs.oracle.com/en-us/iaas/Content/Monitoring/Reference/mql.htm)

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/angeline-hilda/OCI-Terraform-Opensearch/blob/main/LICENSE) file for details.