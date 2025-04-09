resource "aws_key_pair" "deployer" {
    key_name = "${var.my_env}-module_automate_key"
    public_key = file("./my_app_infra_module/my-key.pem.pub")
}

resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "module_security_group" {
    name = "${var.my_env}-aws_sg"
    description = "Security group for Terraform_module"
    vpc_id = "aws_default_vpc.default.id"

dynamic "ingress" {
    for_each = local.ingress_rules
    content {
        from_port = ingress.value.from_port
        to_port = ingress.value.to_port
        protocol = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
        description = ingress.value.description
    }
}

dynamic "egress"{

    for_each = local.egress_rules
    content {
        from_port = egress.value.from_port
        to_port = egress.value.to_port
        protocol = egress.value.protocol
    }
}

tags = var.sg_tags

}

resource "aws_instance" "my_app_server" {
    count = var.instance_count
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.deployer.id
    security_groups = [aws_security_groups.module_security_groups.name]
    user_data = var.user_data
    tags = {
        name = "${var.my_env}-my-app-server"
    }
}