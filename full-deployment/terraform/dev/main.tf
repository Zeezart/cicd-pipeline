provider "aws" {
   region = var.aws_region
}

resource "aws_key_pair" "vibez_key" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdMtRNTBHb+fUMmrMUe8Hk2+Bn/wtiFIkCQCA71uHMUAzredqbVvQ9WiiwtsmKnvrFrU3fL8pOGB93VUQcMlED5SSBENQUOTqCKGoPzoR/MBiAm8CwDP9C694c/emf+TYcDkZuy8lK9WEkWsUrys9EjO11OTxZpwenckvOGKcpor6u0AwYT3EAjD3FWQ5JCkrGjwxBj2PouC6Y9H7cwFNAivGK7PZSUEkHON2o6B7IMOakhE4eUWe3cvQSiXQRmvWE8V7II6ojaSQTgwTVTZ8v2bAYwP+EZXEf3OWsGRIVhkTlCJcw+X9Hmk8noqn9qS51Vw3nEueEIrm/SkPKzAo1 USER@DESKTOP-EOGQABC"
}

resource "aws_instance" "vibez_dev" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.vibez_key.key_name
  security_groups = [ aws_security_group.vibez_sg.name ]

  tags = {
    Name = "Dev"
  }
}