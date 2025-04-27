# LAUNCHING EC2 INSTANCE USING TERRAFORUM SCRIPT
provider "aws" {
    region = "us-east-1"
    access_key = "*****"
    secret_key = "****"
}

resource "aws_instance" "admin" {
        ami = "ami-0c4e709339fa8521a" 
        instance_type = "t2.medium"
        security_groups = [ "default" ]
        key_name = "terraform"

     root_block_device {
        volume_size = 25
        volume_type = "gp3"
        delete_on_termination = true
     }

     tags = {
        Name ="Admin-server"
     }   
}

output "publicIP" {
            value = aws_instance.admin.public_ip
}
