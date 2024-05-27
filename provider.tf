terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0" # Use a version constraint that matches the provider versions used when creating the plan
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
