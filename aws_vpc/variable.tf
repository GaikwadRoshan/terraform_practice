variable "public_subnet_cidr" {
    type = list(string)
    description = "giving public subnet values"
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidr" {
    type = list(string)
    description = "giving private subnet values"
    default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "awz" {
    type = list(string)
    description = "giving availability zones"
    default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

