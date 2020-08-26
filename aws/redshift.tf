provider "aws" {
  version = "~> 3.0"
  region  = "us-east-2"
}
resource "aws_redshift_cluster" "dataflow_resource" {
  cluster_identifier  = "dataflow-redshift-cluster"
  database_name       = "dataflow"
  master_username     = "adm1n157r470r"
  master_password     = "OdfdPdeanfioefn232dedw"
  node_type           = "dc2.large"
  cluster_type        = "single-node"
  skip_final_snapshot = true
}
