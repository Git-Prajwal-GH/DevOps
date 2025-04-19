provider "aws" {
    region = "us-east-1"              # add region
    access_key = ""                # add IAM console>users>security-credentials
    secret_key = ""                # add IAM console>users>security-credentials
}

resource "aws_instance" "admin" {
        ami = "ami-084568db4383264d4"            # copy from AMI catalog which is displayed
        instance_type = "t2.medium"              # choose "t2.medium" instance
        security_groups = [ "default" ]          # set security group as default
        key_name = "k8s"                   # Give keypair
        root_block_device {
        volume_size = 20                         # edit required storage capacity
        volume_type = "gp3"
        delete_on_termination = true             # EBS will get auto-deleted affter destroying the instance

     }

     tags = {
        Name ="Admin-server"    # Instance name
     }
}


output "publicIP" {
            value = aws_instance.admin.public_ip    # Gives output of Pub.ip when script executed
}