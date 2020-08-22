variable "project_name" {
  type = string
}
variable "region" {
  type    = string
  default = "us-central1"
}
variable "bucket_name" {
description = "Google Cloud Storage bucket name"
type        = string
}

