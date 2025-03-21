# S3 BUCKET CREATING USING TERRAFORM SCRIPT



<img alt="Terraform" src="https://github.com/user-attachments/assets/9e22d554-b974-47d1-b290-4c7e0501e13e" width="600px">



```
S3 BUCKET SCRIPT

provider "aws"{
      region="us-east-1"
      access_key="*****"
      secret_key="******"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

        tags = {
            Name = "test-vpc"
        }
}
```
