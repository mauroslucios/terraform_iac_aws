resource "aws_security_group" "acesso-ssh"{
    name = "acesso-ssh"
    description = "criando grupo paa acesso ssh de dev"

    ingress{
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["138.117.221.194/32"]
    }

    tags = {
        Name = "ssh"
    }
}


resource "aws_security_group" "acesso-ssh-us-east-2"{
    provider = aws.us-east-2
    name = "acesso-ssh"
    description = "criando grupo paa acesso ssh de dev"

    ingress{
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["138.117.221.194/32"]
    }

    tags = {
        Name = "ssh"
    }
}
