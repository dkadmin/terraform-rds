region = "ap-south-1"

availability_zones = ["ap-south-1a", "ap-south-1b"]

namespace = "eg"

stage = "test"

name = "rds-test"

deletion_protection = false

database_name = "DEMODB"

database_user = "admin"

database_password = "welcometords#123"

database_port = 1521

multi_az = false

storage_type = "io1"

storage_encrypted = true

allocated_storage = 100

engine = "oracle-ee"

engine_version = "12.1.0.2.v19"

major_engine_version = "12.1"

instance_class = "db.m5.xlarge"

db_parameter_group = "oracle-ee-12.1"

publicly_accessible = false

apply_immediately = true
