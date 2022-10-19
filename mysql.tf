resource "aws_db_instance" "mysql_dev" {
  provider = "aws.us-east-2"
  allocated_storage    = 10
  db_name              = "mysql_dev"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "root"
  password             = "aT!t6d3S"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}