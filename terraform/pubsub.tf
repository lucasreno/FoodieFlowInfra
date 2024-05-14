resource "google_pubsub_schema" "pubsub" {
  project = var.project_id
  name = "main-ps-ff"
  type = "AVRO"
  definition = <<EOF
{
  "type": "record",
  "name": "Order",
  "fields": [
    {"name": "order_id", "type": "string"},
    {"name": "order_date", "type": "string"},
    {"name": "order_amount", "type": "double"}
  ]
}

EOF
}

resource "google_pubsub_topic" "pubsub" {
  project = var.project_id
  name = "order-topic-ff"
  schema_settings {
    schema = google_pubsub_schema.pubsub.name
  }
}