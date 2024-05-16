# From github actions
variable "project_id" {
  description = "The project ID to host the cluster in"
}
variable "environment" {
  description = "The environment for ambient"
}
# From terraform
variable "ps_name" {
  description = "The name of the Pub/Sub"
  default     = "main-ps-ff"
}
variable "ps_topic" {
  description = "The name of the Pub/Sub topic"
  default     = "order-topic-ff"
}
variable "ps_encoding" {
  description = "The encoding of the Pub/Sub topic"
  default     = "JSON"
}