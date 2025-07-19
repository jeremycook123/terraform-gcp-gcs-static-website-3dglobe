output "bucket_id" {
  description = "The id of the bucket"
  value       = google_storage_bucket.website.id
}

output "bucket_website_endpoint" {
  description = "The website url of the bucket"
  value       = "http://storage.googleapis.com/${local.name_with_env}/index.html"
}
