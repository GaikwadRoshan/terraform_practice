variable "ami_id" {
    type = string
    default = "ami-0e35ddab05955cf57"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_tag" {
    type = map
    default = {
        name = "hellow_world"
    }
}

variable "sg_name" {
    type = string
    default = "aws_security_group"
}

variable "sg_description" {
    type = string
    default = "Security group for Terraform"
}



variable "sg_tags" {
    type = map 
    default = {
        name = "target_group"
    }
}

locals {
    ingress_rules = [
    {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "TLS from VPC"
    },

    {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP from VPC"
    },

    {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTPS from VPC"
    }
    ]

    egress_rules = [
        {
        from_port   = 0
        to_port     = 0
        protocol   = "-1"
        }
    ]
}
