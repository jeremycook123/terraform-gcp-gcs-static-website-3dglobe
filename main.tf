resource "random_pet" "suffix" {
  length = 1
}

locals {
  random_suffix = var.create_random_suffix ? "${var.bucket_name}-${random_pet.suffix.id}" : var.bucket_name
  name_with_env = "${local.random_suffix}-${var.environment}"
}

resource "google_storage_bucket" "website" {
  name                        = local.name_with_env
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }

  labels = var.tags
}

resource "google_storage_bucket_iam_binding" "public_read" {
  bucket = google_storage_bucket.website.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}

resource "google_storage_bucket_object" "index_html" {
  name         = "index.html"
  bucket       = google_storage_bucket.website.name
  source       = "${path.module}/website/index.html"
  content_type = "text/html"
}

resource "google_storage_bucket_object" "globe_js" {
  name         = "globe.js"
  bucket       = google_storage_bucket.website.name
  source       = "${path.module}/website/globe.js"
  content_type = "application/javascript"
}

resource "google_storage_bucket_object" "elevation_json" {
  name         = "elevation_15000.json"
  bucket       = google_storage_bucket.website.name
  source       = "${path.module}/website/elevation_15000.json"
  content_type = "application/json"
}

resource "google_storage_bucket_object" "world_jpg" {
  name         = "world.jpg"
  bucket       = google_storage_bucket.website.name
  source       = "${path.module}/website/world.jpg"
  content_type = "image/jpeg"
}

resource "google_storage_bucket_object" "js_folder" {
  for_each = fileset("${path.module}/website/js", "*.js")

  name         = "js/${each.key}"
  bucket       = google_storage_bucket.website.name
  source       = "${path.module}/website/js/${each.key}"
  content_type = "application/javascript"
}
