resource "google_bigquery_dataset" "dataflow_dataset" {
  dataset_id                  = "dataflow_hybrid_cloud"
  friendly_name               = "dataflowdataset"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels = {
    env = "dev"
  }

  access {
    role          = "WRITER"
    special_group = "projectWriters" 
  }
  access {
    role          = "OWNER"
    special_group = "projectOwners" 
  }
  access {
    role          = "READER"
    special_group = "projectReaders" 
  }
}


