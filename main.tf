terraform{
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}


provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    alias = "us-east-2"
    region = "us-east-2"
}


resource "aws_instance" "dev"{
    count = 3
    ami = "ami-08c40ec9ead489470"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}


resource "aws_s3_bucket" "dev4"{
    bucket = "repobucket-dev4"
    #acl    = "private"
    tags = {
        Name = "repobucket-dev4"
    }
}

resource "aws_instance" "dev4"{
    ami = "ami-08c40ec9ead489470"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev4"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
    depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5"{
    ami = "ami-08c40ec9ead489470"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev5"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev6"{
    ami = "ami-097a2df4ac947655f"
    provider = "aws.us-east-2"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev6"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
    depends_on = ["aws_db_instance.mysql_dev"]
}

