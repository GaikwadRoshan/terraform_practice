resource "aws_instance" "demo" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.tf_sf.name]
    tags = var.instance_tag
    user_data= "${file("${path.module}/shell_script.sh")}"
}

resource "aws_key_pair" "deployer" {
  key_name   = "my-key"
  public_key = file("my-key.pem.pub")  # Ensure this file exists
}
resource "aws_default_vpc" "default" {
}

resource "aws_security_group" "tf_sf" {
    name        = "var.sg_name"
    description = "var.sg_description"
    vpc_id = aws_default_vpc.default.id

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
