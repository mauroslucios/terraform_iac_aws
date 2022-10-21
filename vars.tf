variable "ami" {
    type = map(string)
    default = {
        "us-east-1" = "ami-08c40ec9ead489470"
        "us-east-2" = "ami-097a2df4ac947655f"
    }
}

variable "cdirs_acesso_remoto"{
    type = list(string)
    default = ["138.117.220.185/32"]
}

variable "key_name" {
    default = "terraform-aws"
}