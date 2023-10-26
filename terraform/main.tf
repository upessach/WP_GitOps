# main.tf

# Specify the Terraform version
terraform {
  required_version = ">= 0.12"
}

# Configure the Docker provider
provider "docker" {}

# Pull a simple Docker image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Run a Docker container using the pulled image
resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx_test"
  ports {
    internal = 80
    external = 10000  # Change this to a non-conflicting port
  }
}
