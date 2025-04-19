provider "aws"{
      region= "us-east-1"
      access_key= "***"         # place your user IAM credentials access key from user
      secret_key = "***"        # place your user IAM credentials access key from user
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

        tags = {
            Name = "test-vpc"
        }
}
