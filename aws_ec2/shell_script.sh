#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1> Welcome to nginx Domain Created by Terraform Script Automation</h1>" | sudo tee /var/www/html/index.html