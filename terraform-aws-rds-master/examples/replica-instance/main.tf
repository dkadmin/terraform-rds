provider "aws" {
  region = "us-west-2"
  
}


module "rds_replica" {
  source                      = "git::https://github.com/cloudposse/terraform-aws-rds-replica.git?ref=master"
  namespace                   = "eg"
  stage                       = "prod"
  name                        = "reporting"
  replicate_source_db         = "arn:aws:rds:ap-south-1:574124503382:db:eg-prod-app"
  #dns_zone_id                 = "Z89FN1IW975KPE"
  host_name                   = "reporting"
  security_group_ids          = ["sg-532d0608"]
  database_port               = 1521
  multi_az                    = "true"
  storage_type                = "gp2"
  storage_encrypted           = "true"
  instance_class              = "db.m5.xlarge"
  publicly_accessible         = "false"
  subnet_ids                  = ["subnet-312fda49", "subnet-350f197e"]
  vpc_id                      = "vpc-6b0b9313"
  auto_minor_version_upgrade  = "true"
  allow_major_version_upgrade = "false"
  apply_immediately           = "false"
  maintenance_window          = "Mon:03:00-Mon:04:00"
  skip_final_snapshot         = "false"
  copy_tags_to_snapshot       = "true"
  backup_retention_period     = 7
  backup_window               = "22:00-03:00"
}
