
# pulls subnet information
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "yasinozturk3580"
    workspaces = {
      name = "vpc"
    }
  }
}


# Finds Ubuntu AMI 
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}