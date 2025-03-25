output "opensearch_id" {
  description = "OCID of opensearch cluster"
  value       = try(module.opensearch_cluster.opensearch_id, null)

}