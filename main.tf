resource aws_instance "demo-example" {
    ami = ami-08b5b3a93ed654d19
    instance_type = "t2.micro"

    tags = {
        name = "demo-example"
    }
    

}