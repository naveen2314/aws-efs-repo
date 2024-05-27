module "efs" {
  source = "git::https://github.com/naveen2314/aws-efs-module.git?ref=7864b8b"

  # File system
  name           = var.name
  creation_token = var.creation_token
  encrypted      = var.encrypted

  performance_mode = var.performance_mode

  # lifecycle_policy = {
  #   transition_to_ia = "AFTER_90_DAYS"
  # }

  # Mount targets / security group
  mount_targets              = var.mount_targets
  security_group_description = var.security_group_description
  #security_group_vpc_id      = var.security_group_vpc_id
  security_group_rules = var.security_group_rules


  tags = var.tags
}
