resource "aws_s3_bucket" "my_demo_bucket"{
    bucket = "${var.my_env}-my-bucket-demo-terraform_module"

    tags = {
        Name = "${var.my_env}-my bucket"
        environment = var.my_env
    }

}