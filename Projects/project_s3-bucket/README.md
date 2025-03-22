# **S3 BUCKET CREATING USING TERRAFORM SCRIPT**

## Launch the EC2 instance 
- AMI - Ubuntu Server 24.04 LTS (HVM)
<img alt="Terraform" src="https://github.com/user-attachments/assets/9e22d554-b974-47d1-b290-4c7e0501e13e" width="600px">

- Instance type - t2.micro
<img alt="Terraform" src="https://github.com/user-attachments/assets/11a7b839-7893-434f-8383-9674cb0ab2c6" width="600px">

- Set key_pair
<img alt="Terraform" src="https://github.com/user-attachments/assets/55693e82-3265-4e6f-b1a6-2d9eb391e2c1" width="600px">

- Choose vpc - DEFAULT
- Choose subnet - DEFAULT 
- Auto assign public ip access - Enable
- Securiy group - use existing securit group as DEFAULT
<img alt="Terraform" src="https://github.com/user-attachments/assets/3e48e509-438a-4676-841a-4f51c2dcd1c6" width="600px">

- Configuration storage - approx 20 GB and gp3
<img alt="Terraform" src="https://github.com/user-attachments/assets/ffacef07-b17b-4ca7-bc41-d82f94bf5ff5" width="600px">

- Launch the instance


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
