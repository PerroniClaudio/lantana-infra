# Configurazione del provider Google Cloud
provider "google" {
  credentials = file("<path-to-your-service-account-key>.json")
  project     = var.project_id
  region      = var.region
}

# Configurazione del DNS su Google Cloud DNS
resource "google_dns_managed_zone" "dns_zone" {
  name        = "${var.resource_prefix}-zone"
  dns_name    = "lantana.com."
  description = "Managed zone per lantana.com"
}

resource "google_dns_record_set" "site_record" {
  name         = "${var.resource_prefix}.lantana.com."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.dns_zone.name
  rrdatas      = ["<IP_ADDRESS_OF_YOUR_SITE>"]
}

# Configurazione di un bucket GCP
resource "google_storage_bucket" "storage_bucket" {
  name          = var.bucket_name
  location      = "EU"
  force_destroy = true
}

# Configurazione di un'istanza di database Cloud SQL (MySQL)
resource "google_sql_database_instance" "sql_instance" {
  name             = var.db_instance_name
  database_version = var.db_version
  region           = var.region

  settings {
    tier = var.db_tier
  }
}

# Configurazione dell'output
output "bucket_url" {
  value = google_storage_bucket.storage_bucket.url
}
