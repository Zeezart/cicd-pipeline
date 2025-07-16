provider "aws" {
   region = var.aws_region
}

data "aws_security_group" "shared_sg" {
  name = "vibes-sg" 
}

data "aws_key_pair" "shared_key" {
  key_name =  var.key_name 
}

resource "aws_instance" "vibez_prod" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = data.aws_key_pair.shared_key.key_name
  security_groups = [ data.aws_security_group.shared_sg.name ]

  tags = {
    Name = "Prod"
  }
}