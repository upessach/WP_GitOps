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
  image = "nginx:latest"
  name  = "nginx_test"
  ports {
    internal = 80
    external = 10000
  }
}

