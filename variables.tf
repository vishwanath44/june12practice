variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "vpc_name" {
  description = "Name of the VPC network"
  default     = "my-custom-vpc"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "my-subnet"
}

variable "instance_names" {
  description = "Names of the Compute Engine instances"
  type        = list(string)
  default     = ["vm-instance-1", "vm-instance-2"]
}

variable "bucket_name" {
  description = "Name of the Cloud Storage bucket (must be globally unique)"
  type        = string
}
