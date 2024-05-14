resource "google_sql_database_instance"  "postgres" {
  name             = "main-db-ff"
  database_version = "POSTGRES_15"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "postgres" {
  name     = "postgres"
  instance = google_sql_database_instance.postgres.name
  password = "postgres"
}

resource "google_sql_database" "db-order" {
  name     = "order"
  instance = google_sql_database_instance.postgres.name
  charset  = "UTF8"
  collation = "en_US.UTF8"
}

resource "google_sql_database" "db-pay" {
  name     = "pay"
  instance = google_sql_database_instance.postgres.name
  charset  = "UTF8"
  collation = "en_US.UTF8"
}