provider "aws" {
  version = "~> 3.0"
  region  = "us-east-2"
}
yesource "aws_redshift_cluster" "dataflow_resource" {
  cluster_identifier = "dataflow-redshift-cluster"
  database_name      = "dataflow"
  master_username    = "4dm1n157r470r"
  master_password    = "4-v3ry-53cr37-p455w0rd"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
}
