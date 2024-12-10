# Configurazione del provider Google Cloud
provider "google" {
  credentials = file("<path-to-your-service-account-key>.json")
  project     = "<your-gcp-project-id>"
  region      = "europe-west8"
}

# Configurazione del DNS su Google Cloud DNS
resource "google_dns_managed_zone" "dns_zone" {
  name        = "${var.resource_prefix}-zone"
  dns_name    = "example.com."
  description = "Managed zone per example.com"
}

# Configurazione di un bucket GCP
resource "google_storage_bucket" "storage_bucket" {
  name          = "${var.resource_prefix}-bucket"
  location      = "EU"
  force_destroy = true
}

# Configurazione di un'istanza di database Cloud SQL (MySQL)
resource "google_sql_database_instance" "sql_instance" {
  name             = "${var.resource_prefix}-instance"
  database_version = "MYSQL_8_0"
  region           = "europe-west8"

  settings {
    tier = "db-f1-micro"
  }
}

# Configurazione dell'output
output "bucket_url" {
  value = google_storage_bucket.storage_bucket.url
}

output "sql_instance_connection_name" {
  value = google_sql_database_instance.sql_instance.connection_name
}