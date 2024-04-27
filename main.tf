terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  region      = "us-east1"
  project     = "vpc-playground-419100"
  zone        = "us-east1-a"
  credentials = "vpc-playground-419100-f1c1244e0d7e.json"

}

resource "google_storage_bucket" "bucket1" {
  name          = "sample_project_4_26"
  location      = "us-east1"
  force_destroy = true

}


resource "google_compute_network" "auto-vpc-tf" {
  name                    = "auto-vpc-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name          = "sub-sg"
  network       = google_compute_network.auto-vpc-tf.id
  ip_cidr_range = "10.72.1.0/24"
  region        = "us-east1"
}


#resource "google_compute_network" "custom-vpc-tf" {
#name = "custom-vpc-tf"
#auto_create_subnetworks = false
#}

output "auto" {
  value = google_compute_network.auto-vpc-tf.id
}

#output "custom" {
#  value = google_compute_network.custom-vpc-tf.id
#}
