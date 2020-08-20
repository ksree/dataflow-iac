module "bigquery" {
  source                     = "terraform-google-modules/bigquery/google"
  version = "~> 4.3"

  dataset_id                 = "dataflow"
  dataset_name               = "dataflow_dataset"
  description                = "Hybrid cloud dataflow"
  project_id                 = var.project_name
  location                   = "US"
  delete_contents_on_destroy = var.delete_contents_on_destroy
  dataset_labels = {
    env      = "dev"
    billable = "true"
    owner    = "dataflow"
  }
}
