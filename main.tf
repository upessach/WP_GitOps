terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13"  # Use the appropriate version
    }
  }
}

provider "docker" {
  # Provider configuration if necessary
}


# Create a docker network for communication between containers
resource "docker_network" "wordpress_net" {
  name = "wordpress_net"
}

# MySQL container for the WordPress instances
resource "docker_container" "mysql" {
  image = "mysql:5.7"
  name  = "mysql"
  networks_advanced {
    name = docker_network.wordpress_net.name
  }
  env = [
    "MYSQL_ROOT_PASSWORD=root_pass",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wpuser",
    "MYSQL_PASSWORD=wppass"
  ]
}

# WordPress instance 1
resource "docker_container" "wordpress_1" {
  image = "wordpress:latest"
  name  = "wordpress_1"
  networks_advanced {
    name = docker_network.wordpress_net.name
  }
  env = [
    "WORDPRESS_DB_HOST=mysql",
    "WORDPRESS_DB_USER=wpuser",
    "WORDPRESS_DB_PASSWORD=wppass",
    "WORDPRESS_DB_NAME=wordpress"
  ]
}

# WordPress instance 2
resource "docker_container" "wordpress_2" {
  image = "wordpress:latest"
  name  = "wordpress_2"
  networks_advanced {
    name = docker_network.wordpress_net.name
  }
  env = [
    "WORDPRESS_DB_HOST=mysql",
    "WORDPRESS_DB_USER=wpuser",
    "WORDPRESS_DB_PASSWORD=wppass",
    "WORDPRESS_DB_NAME=wordpress"
  ]
}

# Nginx load balancer
resource "docker_container" "nginx_lb" {
  image = "nginx:latest"
  name  = "nginx_lb"
  networks_advanced {
    name = docker_network.wordpress_net.name
  }
  ports {
    internal = 80
    external = 10000
  }
  volumes {
    container_path  = "/etc/nginx/conf.d/default.conf"
    host_path      = "${abspath(path.module)}/nginx.conf"  # Updated to ensure absolute path
    read_only      = true
  }
}
