# From github actions
variable "project_id" {
  description = "The project ID to host the cluster in"
}
variable "region" {
  description = "The region to host the cluster in"
}
variable "environment" {
  description = "The environment for ambient"
}
variable "pg_password" {
  description = "The password of the PostgreSQL user"
  sensitive   = true
}
# From terraform
variable "pg_user" {
  description = "The name of the PostgreSQL user"
  default     = "postgres"
}
variable "pg_tier" {
  description = "The tier of the PostgreSQL instance"
  default     = "db-f1-micro"
}
variable "pg_instance_name" {
  description = "The name of the PostgreSQL instance"
  default     = "main-db-ff"
}
variable "pg_version" {
  description = "The version of the PostgreSQL database"
  default     = "POSTGRES_15"
}
variable "pg_db_order" {
  description = "The name of the order database"
  default     = "ff-order"
}
variable "pg_db_pay" {
  description = "The name of the payment database"
  default     = "ff-pay"
}
variable "fs_db_name" {
  description = "The name of the Firestore database"
  default     = "main-fs-ff"
}
variable "fs_location" {
  description = "The location of the Firestore database"
  default     = "nam5"
}
variable "fs_collection" {
  description = "The collection to create an index for"
  default     = "order"
}