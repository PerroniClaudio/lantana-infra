# variables.tf

variable "resource_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "europe-west8"
}

variable "credentials_file" {
  description = "Path to the service account credentials file"
  type        = string
}

variable "bucket_name" {
  description = "Name of the GCP storage bucket"
  type        = string
  default     = "${var.resource_prefix}-bucket"
}

variable "db_instance_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
  default     = "${var.resource_prefix}-instance"
}

variable "db_tier" {
  description = "The machine type for the Cloud SQL instance"
  type        = string
  default     = "db-f1-micro"
}

variable "db_version" {
  description = "The version of the Cloud SQL database"
  type        = string
  default     = "MYSQL_8_0"
}

variable "dns_zone_name" {
  description = "Name of the DNS managed zone"
  type        = string
  default     = "${var.resource_prefix}-zone"
}

variable "dns_name" {
  description = "DNS name for the managed zone"
  type        = string
  default     = "example.com."
}