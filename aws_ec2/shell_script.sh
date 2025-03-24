#!/bin/bash
sudo apt-get install
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1> Welcome to nginx Domain Created by Terraform Script Automation</h1>" > /var/www/html/index.html