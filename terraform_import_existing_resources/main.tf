
provider aws {
# Configuration options

region = "ap-south-1"
}

resource "aws_instance" "main" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    tags = {
        name = "tf-server"
    }

}