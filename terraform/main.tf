resource "google_compute_instance" "app" {
  name         = "vaadin-devops-vm"
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["vaadin-app"]

  boot_disk {
    initialize_params {
      image = "projects/cos-cloud/global/images/family/cos-stable"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    set -euxo pipefail

    docker rm --force vaadin-app || true
    docker pull "${var.docker_image}"

    docker run \
      --detach \
      --name vaadin-app \
      --restart always \
      --publish ${var.app_port}:${var.app_port} \
      --env PORT=${var.app_port} \
      "${var.docker_image}"
  EOT
}

resource "google_compute_firewall" "allow_app" {
  name        = "allow-vaadin-app"
  description = "Allow public access to the Vaadin application"
  network     = "default"
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = [tostring(var.app_port)]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["vaadin-app"]
}
