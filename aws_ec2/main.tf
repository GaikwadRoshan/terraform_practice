resource "aws_instance" "demo" {
    ami = "var.ami_id"
    instance_type = "var.instance_type"
    security_groups = [aws_security_group.tf_sf.name]
    tags = var.instance_tag
    user_data= file("shell_script.sh")
}

resource "aws_security_group" "tf_sf" {
    name        = "var.sg_name"
    description = "var.sg_description"
    vpc_id = "var.vpc_id"

dynamic "ingress" {
    for_each = local.ingress_rules
    content {
        from_port = ingress.values.from_port
        to_port = ingress.values.to_port
        protocol = ingree.values.protocol
        cidr_blocks = [ingress.values.cidr_blocks]
        description = ingress.values.description
    }
}

dynamic "egress"{

    for_each = local.egress_rules
    content {
        from_port = egress.values.from_port
        to_port = egress.values.to_port
        protocol = egress.values.protocol
    }
}
 

tags = var.sg_tags

}
