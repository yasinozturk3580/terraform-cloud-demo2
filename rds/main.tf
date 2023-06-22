data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "yasinozturk3580"
    workspaces = {
      name = "vpc"
    }
  }
}


resource "aws_db_subnet_group" "default" {
  name       = "project-db-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.output.private_subnets
}

