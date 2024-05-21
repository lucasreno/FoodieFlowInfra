resource "google_firestore_database" "firestore" {
  project                           = var.project_id
  name                              = "${var.fs_db_name}-${var.environment}"
  location_id                       = var.fs_location
  type                              = "FIRESTORE_NATIVE"
}

resource "google_firestore_index" "firestore" {
  project = var.project_id
  database = google_firestore_database.firestore.name
  collection = var.fs_collection
  depends_on = [google_firestore_database.firestore]
  fields {
    field_path = "order_id"
    order = "ASCENDING"
  }
  fields {
    field_path = "order_date"
    order = "ASCENDING"
  }
}