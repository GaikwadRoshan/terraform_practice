###dev_app

module "dev_infra" {
    source = "./my_app_infra_module"
    my_env = "dev"
    instance_count = 1
    instance_type = "t2.micro"
    ami_id = "ami-0e35ddab05955cf57"
    hash_key = "studentid"
    sg_tags =   {
    Name = "sgdev"
  }
    
    user_data = <<-EOF
    #!/bin/bash
    echo "Starting EC2 Instance..."
    echo "This is a print message from the user_data script!" > /var/log/user_data_output.log
    apt-get update
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2
    echo "Apache installation and service start completed!" >> /var/log/user_data_output.log
  EOF
}

    


