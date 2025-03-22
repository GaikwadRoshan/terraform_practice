resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        name = "project_vpc"

    }
}

resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.public_subnet_cidr, count.index)
    availability_zone = element(var.awz , count.index)

    tags = {
        name = "public_subnet_${count.index + 1}"
    }
}

resource "aws_subnet" "private" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.private_subnet_cidr, count.index)
    availability_zone = element(var.awz , count.index)

    tags = {
        name = "private_subnet_${count.index + 1}"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id
    
    tags = {
        name = internet_gateqay_gw
    }
}

resource "aws_route_table" "second_rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
        name = "second route table"
    
    }
}

resource "aws_route_table_association" "public_subnet" {
    count = length(var.public_subnet_cidr)
    subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
    route_table_id = aws_route_table.second_rt.id
}

