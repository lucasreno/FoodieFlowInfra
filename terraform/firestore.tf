resource "google_firestore_database" "firestore" {
  project                           = var.project_id
  name                              = "main-fs-ff"
  location_id                       = "nam5"
  type                              = "FIRESTORE_NATIVE"
}

resource "google_firestore_index" "firestore" {
  project = var.project_id
  database = google_firestore_database.firestore.name
  collection = "order"
  fields {
    field_path = "order_id"
    order = "ASCENDING"
  }
  fields {
    field_path = "order_date"
    order = "ASCENDING"
  }
}