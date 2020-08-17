resource "google_dataproc_cluster" "dataflowcluster" {
  name   = "dataflowcluster"
  region = "us-central1"
  labels = {
    cluster = "dataproc"
  }

  cluster_config {

    master_config {
      num_instances = 1
      machine_type  = "n1-standard-1"
      disk_config {
        boot_disk_type    = "pd-ssd"
        boot_disk_size_gb = 15
      }
    }

    worker_config {
      num_instances    = 2
      machine_type     = "n1-standard-1"
      min_cpu_platform = "Intel Skylake"
      disk_config {
        boot_disk_size_gb = 15
        num_local_ssds    = 1
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }

  }
}

# Submit an example spark job to a dataproc cluster
resource "google_dataproc_job" "spark" {
  region       = google_dataproc_cluster.dataflowcluster.region
  force_delete = true
  placement {
    cluster_name = google_dataproc_cluster.dataflowcluster.name
  }

  spark_config {
    main_class    = "org.apache.spark.examples.SparkPi"
    jar_file_uris = ["file:///usr/lib/spark/examples/jars/spark-examples.jar"]
    args          = ["1000"]

    properties = {
      "spark.logConf" = "true"
    }

    logging_config {
      driver_log_levels = {
        "root" = "INFO"
      }
    }
  }
}

# Check out current state of the jobs
output "spark_status" {
  value = google_dataproc_job.spark.status[0].state
}