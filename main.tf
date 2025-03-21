resource aws_resource "demo-example" {
    ami_id = ami-08b5b3a93ed654d19
    instance_type = "t2.micro"

    tags = {
        name = "demo-example"
    }
    

}