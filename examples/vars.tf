variable "region" {
  description = "GCP region for the resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone for the resources"
  type        = string
  default     = "us-central1-a"
}

variable "bucket_name" {
  description = "Name of S3 bucket for the website"
  type        = string
  default     = "3dglobe"
}

variable "tags" {
  description = "Tags for the bucket"
  type        = map(string)
  default     = {}
}

variable "create_random_suffix" {
  description = "Add random suffix to bucket name"
  type        = bool
  default     = true
}

variable "environment" {
  description = "Environment bucket resides in"
  type        = string
  default     = "dev"
}
