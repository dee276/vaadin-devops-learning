variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region used for the infrastructure"
  type        = string
  default     = "northamerica-northeast1"
}

variable "zone" {
  description = "Google Cloud zone used for the virtual machine"
  type        = string
  default     = "northamerica-northeast1-a"
}

variable "machine_type" {
  description = "Compute Engine machine type"
  type        = string
  default     = "e2-micro"
}

variable "app_port" {
  description = "TCP port exposed by the Vaadin application"
  type        = number
  default     = 8081
}

variable "docker_image" {
  description = "Full Docker image name and tag"
  type        = string
}

variable "ssh_public_key" {
  description = "Public SSH key authorized to deploy the application"
  type        = string
}