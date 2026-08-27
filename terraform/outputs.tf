output "public_ip" {
  description = "Public IPv4 address of the Vaadin VM"
  value       = google_compute_instance.app.network_interface[0].access_config[0].nat_ip
}

output "application_url" {
  description = "URL of the Vaadin application"
  value       = "http://${google_compute_instance.app.network_interface[0].access_config[0].nat_ip}:${var.app_port}"
}