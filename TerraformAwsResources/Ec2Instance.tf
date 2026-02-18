provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "web_server" {
    ami = var.ami
    instance_type = "t2.small"
    key_name = var.key_pair
    vpc_security_group_ids = [aws_default_security_group.default.id]
     user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl --now enable apache2
                EOF
                

}

variable "ami" {
    description = "default ami ubuntu"
    default =  "ami-019715e0d74f695be"
}
variable "key_pair" {
    default = "superkey" 
  
}

resource "aws_default_vpc" "default" {}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id
}



    
  



  


