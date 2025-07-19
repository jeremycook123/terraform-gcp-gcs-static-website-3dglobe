terraform {
  required_version = ">=1.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.44.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.1"
    }
  }
}

provider "google" {
  credentials = file("./auth.json")
  project     = "ca-devops-123456"
  region      = var.region
  zone        = var.zone
}

module "webglobe" {
  source = "../"

  region               = var.region
  zone                 = var.zone
  bucket_name          = var.bucket_name
  tags                 = var.tags
  create_random_suffix = var.create_random_suffix
  environment          = var.environment
}
