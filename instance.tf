provider "aws" {
  region = var.region
}
 
resource "aws_instance" "example" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = var.instance_type
}
 
provisioner "local-exec" {
  command = "./example.sh && terraform apply -auto-approve"
}
