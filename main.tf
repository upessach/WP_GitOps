provider "docker" {}

resource "docker_container" "wordpress" {
  image = "wordpress:latest"
  name  = "wordpress"
  ports {
    internal = 80
    external = 10000
  }
}

resource "docker_container" "db" {
  image = "mysql:5.7"
  name  = "db"
  env   = [
    "MYSQL_RANDOM_ROOT_PASSWORD=1",
    "MYSQL_DATABASE=mysqldb",
    "MYSQL_USER=mysqluser",
    "MYSQL_PASSWORD=12345678"
  ]
}

// More configurations according to your requirements
