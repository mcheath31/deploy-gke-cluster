terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
}

terraform {
  backend "gcs" {
    bucket      = "mheathtf-bucket"
    credentials = "devops-project-340122-ed9ed2d41da6.json"
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  credentials = file(var.credentials_file)

  project = var.project
  region = var.region
  zone = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_storage_bucket" "mheathtf-bucket" {
  project       = var.project
  name          = var.bucket-name
  location      = var.region
  storage_class = var.storage-class
  force_destroy = true
  versioning {
    enabled = true
  }
}

