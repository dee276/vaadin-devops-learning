output "public_ip" {
  description = "Static public IPv4 address of the Vaadin VM"
  value       = google_compute_address.app.address
}

output "application_url" {
  description = "URL of the Vaadin application"
  value       = "http://${google_compute_address.app.address}:${var.app_port}"
}