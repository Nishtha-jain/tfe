provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
}

resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip}
  }
}
