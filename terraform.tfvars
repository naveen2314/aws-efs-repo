name = "example-nfs"

creation_token = "example-nfs"

encrypted = true

performance_mode = "generalPurpose"

mount_targets = {
  "us-east-1a" = {
    subnet_id = "subnet-0f02631033364cb76"
  }

  us-east-1b = {
    subnet_id = "subnet-0fdec26c99c7773d4"
  }
}

security_group_description = "First SG Module for testing"
security_group_vpc_id      = vpc-014e7030d00814465

security_group_rules = {
  vpc = {
    description = "NFS ingress from VPC private subnets"
    cidr_blocks = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
  }
}

tags = {
  "name" = "first-efs"
}
