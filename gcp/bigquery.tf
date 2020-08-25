resource "google_bigquery_dataset" "dataflow" {
  dataset_id                  = "dataflow_hybrid_cloud"
  friendly_name               = "dataflow dataset"
  description                 = "This is the dataset for dataflow project"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels = {
    env = "dev"
  }

  access {
    role          = "OWNER"
    user_by_email = "kapilsreed12@gmail.com"

  }

}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}
