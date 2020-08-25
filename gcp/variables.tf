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
variable "delete_contents_on_destroy" {
  description = "(Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present."
  type        = bool
  default     = null
}

