# main.tf

# Specify the Terraform version
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.15.0"  # You can specify a version here
    }
  }
}

# Configure the Docker provider
provider "docker" {}

# Pull a simple Docker image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Run a Docker container using the pulled image
resource "docker_container" "nginx" {
  image = docker_image.nginx.id
  name  = "nginx_test"
  ports {
    internal = 80
    external = 10000  # Change this to a non-conflicting port
  }
}
