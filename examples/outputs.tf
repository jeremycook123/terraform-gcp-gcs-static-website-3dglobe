output "bucket_id" {
  description = "The id of the bucket"
  value       = module.webglobe.bucket_id
}

output "bucket_website_endpoint" {
  description = "The website url of the bucket"
  value       = module.webglobe.bucket_website_endpoint
}
