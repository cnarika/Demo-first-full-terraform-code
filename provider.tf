terraform { # parent module
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~>4.23.0"
      }
    }
}
provider "aws" { # child module
    region = "${var.region}"
}