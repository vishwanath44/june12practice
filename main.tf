provider "google" {
  project = "fluted-depth-459610-p4"
  region  = "us-central1"
  zone    = "us-central1-a"
}

# VPC Network
resource "google_compute_network" "custom_vpc" {
  name                    = "my-custom-vpc"
  auto_create_subnetworks = false
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.custom_vpc.id
}

# Compute Engine Instance 1
resource "google_compute_instance" "vm1" {
  name         = "vm-instance-1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {}  # For external IP
  }
}

# Compute Engine Instance 2
resource "google_compute_instance" "vm2" {
  name         = "vm-instance-2"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {}
  }
}

# Cloud Storage Bucket
resource "google_storage_bucket" "bucket" {
  name          = "my-unique-bucket-123456"  # must be globally unique
  location      = "US"
  force_destroy = true
}

added new one vpc