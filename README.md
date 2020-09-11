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

Create Confluent Cloud Kafka Cluster
   
   1. Install cloud client: 
       ```shell script
           cd ~/dataflow-iac/confluent/
           sudo ./install_cloud_cli.sh
       ```

   2. Login to your confluent cloud cluster using ccloud client:
       ```shell script
           ccloud login
       ```
   3. Create confluent cloud cluster on GCP
       ```shell script
           ccloud kafka cluster create dataflow_kafka_cluster --cloud "gcp" --region "us-east1"
       ```
   You will see an output similar to this: 
       
       
       It may take up to 5 minutes for the Kafka cluster to be ready.
        +--------------+--------------------------------------------------------+
        | Id           | lkc-v883n                                              |
        | Name         | dataflow_kafka_cluster                                 |
        | Type         | BASIC                                                  |
        | Ingress      |                                                    100 |
        | Egress       |                                                    100 |
        | Storage      |                                                   5000 |
        | Provider     | gcp                                                    |
        | Availability | LOW                                                    |
        | Region       | us-east1                                               |
        | Status       | UP                                                     |
        | Endpoint     | SASL_SSL://pkc-4yyd6.us-east1.gcp.confluent.cloud:9092 |
        | ApiEndpoint  | https://pkac-ew1dj.us-east1.gcp.confluent.cloud        |
        +--------------+--------------------------------------------------------+
        
   Verify the newly created cluster:
   ```shell script
       ccloud kafka cluster list
   ```
   
   You will see an output similar to this :
   ```text
        Id      |          Name          | Type  | Provider |  Region  | Availability | Status
     -------------+------------------------+-------+----------+----------+--------------+--------+
     lkc-v883n | dataflow_kafka_cluster | BASIC | gcp      | us-east1 | LOW          | UP
        
   ```
   Note down your Id, you will need to create a Kafka Topic.
    
   You can also verify the Cluster by login in at  :
     https://confluent.cloud/login
   
   
   4. Create a new Kafka Topic:
      
      Set the Id into an environment variable
   ```shell script
      export CLUSTER_ID=<YOUR_CLUSTER_ID>
   ```

   ```shell script
      ccloud kafka topic create \
       -- cluster $CLUSTER_ID \
       --partitions 6 \
       --verbose \
       transactions
   ```


 [Check out this article to see how this project is used](https://medium.com/@kapilsreed/build-a-hybrid-multi-cloud-data-lake-and-perform-data-processing-using-apache-spark-ecabedd54882)
