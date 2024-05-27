module "efs" {
  source = "terraform-aws-modules/efs/aws"

  # File system
  name           = "example"
  creation_token = "example-token"
  encrypted      = true

  performance_mode = "generalPurpose"

  lifecycle_policy = {
    transition_to_ia = "AFTER_30_DAYS"
  }

  # File system policy
  #   attach_policy                      = true
  #   bypass_policy_lockout_safety_check = false
  #   policy_statements = [
  #     {
  #       sid     = "Example"
  #       actions = ["elasticfilesystem:ClientMount"]
  #       principals = [
  #         {
  #           type        = "AWS"
  #           identifiers = ["arn:aws:iam::111122223333:role/EfsReadOnly"]
  #         }
  #       ]
  #     }
  #   ]

  # Mount targets / security group
  mount_targets = {
    "us-east-1a" = {
      subnet_id = "subnet-0f02631033364cb76"
    }
    "us-east-1b" = {
      subnet_id = "subnet-0fdec26c99c7773d4"
    }
    "us-east-1c" = {
      subnet_id = "	subnet-0d02b4507ce4f9aab"
    }
  }
  security_group_description = "Example EFS security group"
  security_group_vpc_id      = "vpc-014e7030d00814465"
  security_group_rules = {
    vpc = {
      # relying on the defaults provdied for EFS/NFS (2049/TCP + ingress)
      description = "NFS ingress from VPC private subnets"
      cidr_blocks = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
    }
  }

  # Access point(s)
  access_points = {
    posix_example = {
      name = "posix-example"
      posix_user = {
        gid            = 1001
        uid            = 1001
        secondary_gids = [1002]
      }

      tags = {
        Additionl = "yes"
      }
    }
    root_example = {
      root_directory = {
        path = "/example"
        creation_info = {
          owner_gid   = 1001
          owner_uid   = 1001
          permissions = "755"
        }
      }
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
