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
    ami = var.ami["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev3"{
    ami = var.ami["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev3"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
    depends_on = [aws_s3_bucket.dev1]
}

resource "aws_instance" "dev4"{
    ami = var.ami["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev4"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev5"{
    ami = var.ami["us-east-2"]
    provider = aws.us-east-2
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
        Name = "dev5"
    }
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
    depends_on = [aws_dynamodb_table.dynamodb-dev]
}

resource "aws_s3_bucket" "dev1"{
    bucket = "repobucket-dev1"
    #acl    = "private"
    tags = {
        Name = "repobucket-dev1"
    }
}
