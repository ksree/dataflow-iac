provider "google" {
project = var.project_name
region  = var.region
}

# Create a GCS Bucket
resource "google_storage_bucket" "dataflow" {
name     = var.bucket_name
location = var.region
}
