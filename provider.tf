terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"  # You can adjust this to the version you prefer
    }
  }

  required_version = ">= 1.3.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
