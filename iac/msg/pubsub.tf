resource "google_pubsub_schema" "pubsub" {
  project = var.project_id
  name = "${var.ps_name}-${var.environment}"
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
  name = var.ps_topic
  schema_settings {
    schema = google_pubsub_schema.pubsub.name
    encoding = var.ps_encoding
  }
}