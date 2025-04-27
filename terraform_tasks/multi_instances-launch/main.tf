provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  default = ["my_server", "staging", "prod"]
}

resource "aws_instance" "web" {
  count         = length(var.instance_names)
  ami           = "ami-0c55b159cbfafe1f0" # Use Ubuntu 22.04 AMI if possible
  instance_type = "t2.micro"
  key_name      = "your-aws-key-name"     # Update this
  tags = {
    Name = var.instance_names[count.index]
  }
  associate_public_ip_address = true
}

output "instance_ips" {
  value = [for instance in aws_instance.web : instance.public_ip]
}
