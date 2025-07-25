
provider aws {
# Configuration options

region = "ap-south-1"
#access_key = 
#secret_key = 
}

resource "aws_instance" "main" {

    #run import command in terminal "terraform import aws_instance.main <your_instance_id>"
    #after import successfull msg give below required details and then terrafoem plan and terraform apply

   # ami = "ami-0f918f7e67a3323f0"
    #instance_type = "t2.micro"
    #tags = {
        #Name = "tf-server"
    #}

}