variable "my_env" {
    description = "this is the environment for app"
    type = string
}

variable "instance_type" {
    description = "this is the instance type for app"
    type = string

}


variable "ami_id" {
    description = "this is the ami id for app"
    type = string
}

variable "instance_count" {
    description = "this is the instance count for app"
    type = number
}

variable "user_data" {
  description = "The user data to initialize the instance"
  type        = string
}

variable "sg_tags" {
    description = "this is the security group tags for app"
    type = map
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

variable "hash_key" {
    description = "this is the hash key for app"
    type = string
}