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
