# dataflow-iac
Dataflow Infrastructure Repository

Requires Terraform 0.12.x and later.

**AWS Provider**

Resource : aws_redshift_cluster

Authentication: Provide your credentials via  AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, environment variables, representing your AWS Access Key and AWS Secret Key, respectively.

**Azure Provider**

Resource: azurerm_sql_server

Authentication : Using a Service Principal and a Client Secret. Provide your credentials via the bellow  environment variables.

ARM_CLIENT_ID

ARM_CLIENT_SECRET

ARM_TENANT_ID

ARM_SUBSCRIPTION_ID
 
 **GCP Provider**
 
 Resource: google_bigquery_dataset
 Resource: google_storage_bucket
 Resource: google_dataproc_cluster
 
 Authentication: Service accounts 
 
  **Confluent Cloud **

   To install Confluent Cloud 
   1. Install cloud client: 
      cd ~/dataflow-iac/confluent
      sudo ./install_cloud_cli.sh
   2. Login to your confluent cloud cluster:
       ccloud login
       
      

 [Check out this article to see how this project is used](https://medium.com/@kapilsreed/build-a-hybrid-multi-cloud-data-lake-and-perform-data-processing-using-apache-spark-ecabedd54882)
