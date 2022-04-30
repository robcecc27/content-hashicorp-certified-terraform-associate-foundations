# Configure the Docker provider
provider "docker" {}

#Image to be used by container
resource "docker_image" "terraform-centos" {
  name         = "centos:7"
  keep_locally = true
}
# Pulls the image
resource "docker_image" "terraform-ubuntu" {
  name         = "ubuntu"
  keep_locally = true
}

# Create a container
resource "docker_container" "centos" {
  image   = docker_image.terraform-centos.latest
  name    = "terraform-centos"
  start   = true
  command = ["/bin/sleep", "500"]
}

# Create a container
resource "docker_container" "ubuntu" {
  image   = docker_image.terraform-ubuntu.latest
  name    = "terraform-ubuntu"
  start   = true
  command = ["/bin/sleep", "500"]
}