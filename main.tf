# This is the main blueprint file for our Terraform robot!

# 1. Tell Terraform we need the "Docker" building tool
terraform {
  required_providers {
    docker = {
      # This tells Terraform where to find the Docker tool
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

# 2. Configure the Docker tool (this is required to connect to Docker)
provider "docker" {}

# 3. Instruction to pull an "image" (like a package of furniture)
# We are getting the Nginx image, which is a simple web server.
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  # Keep the image on our computer after Terraform is done
  keep_locally = true
}

# 4. Instruction to build the "container" (the actual house)
resource "docker_container" "web_server" {
  # Give the house a friendly name so we can find it easily
  name  = "tf_nginx_web_server"
  # Use the furniture package we downloaded above
  image = docker_image.nginx_image.name

  # Open a door to the outside world
  ports {
    # The container's internal door is port 80
    internal = 80
    # We map it to port 8081 on your computer so you can check it (CHANGED FROM 8080)
    external = 8081 
  }

  # Make sure the container restarts automatically if it stops
  restart = "always"
}
