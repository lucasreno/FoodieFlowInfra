resource "google_sql_database_instance"  "postgres" {
  name             = "${var.pg_instance_name}-${var.environment}"
  database_version = var.pg_version
  region           = var.region

  settings {
    tier = var.pg_tier

    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "all-ips"
        value = "0.0.0.0/0"
      }
    }
  }
}

resource "google_sql_user" "postgres" {
  name     = var.pg_user
  instance = google_sql_database_instance.postgres.name
  password = var.pg_password
}

resource "google_sql_database" "db-order" {
  name     = var.pg_db_order
  instance = google_sql_database_instance.postgres.name
  charset  = "UTF8"
  collation = "en_US.UTF8"
}

resource "google_sql_database" "db-pay" {
  name     = var.pg_db_pay
  instance = google_sql_database_instance.postgres.name
  charset  = "UTF8"
  collation = "en_US.UTF8"
}