provider "aws" {
  region = "ap-south-1"

}


module "rds_instance" {
    source                      = "git::https://github.com/cloudposse/terraform-aws-rds.git?ref=master"
    namespace                   = "eg"
    stage                       = "prod"
    name                        = "app"
    dns_zone_id                 = "Z89FN1IW975KPE"
    host_name                   = "db"
    security_group_ids          = ["sg-0046a4e8de0e30dad"]
    ca_cert_identifier          = "rds-ca-2019"
    allowed_cidr_blocks         = ["172.16.0.0/16"]
    database_name               = "DEMODB"
    database_user               = "admin"
    database_password           = "YourPwdShouldBeLongAndSecure!"
    database_port               = 1521
    multi_az                    = false
    storage_type                = "gp2"
    allocated_storage           = 100
    storage_encrypted           = true
    engine                      = "oracle-ee"
    engine_version              = "12.1.0.2.v19"
    major_engine_version        = "12.1"
    instance_class              = "db.m5.xlarge"
    db_parameter_group          = "oracle-ee-12.1"
    option_group_name           = "eg-test-rds-test"
    publicly_accessible         = false
    subnet_ids                  = ["subnet-07ac22e60ffc743fc", "subnet-093b2f2da6a73b345"]
    vpc_id                      = "vpc-01e18b20cc45528d6"
 #   snapshot_identifier         = "rds:production-2015-06-26-06-05"
    auto_minor_version_upgrade  = true
    allow_major_version_upgrade = false
    apply_immediately           = false
    maintenance_window          = "Mon:03:00-Mon:04:00"
    skip_final_snapshot         = false
    copy_tags_to_snapshot       = true
    backup_retention_period     = 7
    backup_window               = "22:00-03:00"

#    db_parameter = [
#      { name  = "bitmap_merge_area_size",   value = "104857" },
#      { name  = "buffer_pool_keep",          value = "209715" }
#    ]
#
#    db_options = [
#      { option_name = "Timezone"
#          option_settings = [
#            { name = "TIME_ZONE",           value = "UTC" },
#          ]
#      }
#    ]
#}


  db_parameter = [
    {
      name         = "bitmap_merge_area_size"
      value        = "10485"
      apply_method = "pending-reboot"
   },
    {
      name         = "buffer_pool_keep"
      value        = "2097152"
      apply_method = "pending-reboot"
   }
  ]
}
