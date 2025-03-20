# VPC CREATING STEPS IN TERRAFORM FORMAT

- Launch the EC2 instance 
*AMI - ubuntu os
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

# INSTANCE CONNECT USING :
- USING SSH CLIENT INTO THE WINDOWS TERMINAL
<img alt="Terraform" src="https://github.com/user-attachments/assets/a7b35743-f7f2-46d8-8acc-22d50d6e48ed" width="600px">

# Switch to root
```
sudo su -
```
# Switch to server
```
hostname terraform-server
bash
apt update && apt upgrade
```
# Install terraform web source
- website link: https://developer.hashicorp.com/terraform/install

# OR
```
# use this cli cmd 
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
# Confirm terraform is available
```
terraform --version
<img alt="Terraform" src="https://github.com/user-attachments/assets/05b6099e-100e-4090-8962-031c1649ecaa" width="600px">

```
# Run this cli cmd 
```
mkdir vpc
cd vpc
vi main.tf
```
# add the script in main.tf
```
provider "aws"{
      region="us-east-1"
      access_key="*****"     # place your user IAM credentials access key from user
      secret_key="******"    # place your user IAM credentials access key from user
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

        tags = {
            Name = "test-vpc"
        }
}
```

```
ls
terraform init
```
<img alt="Terraform" src="(https://github.com/user-attachments/assets/215b52dc-7af8-4d26-8c08-ad1b866c2b4f" width="600px">
```
ls -a  # to see terraform initialized
```
<img alt="Terraform" src="https://github.com/user-attachments/assets/983635f7-be96-4a86-8308-ebc2bff477fc" width="600px">
```
terraform validate 
```
<img alt="Terraform" src="https://github.com/user-attachments/assets/41dc48f0-63ae-45eb-8489-13b3da04a6ad" width="600px">
```
terraform plan 
```
<img alt="Terraform" src="https://github.com/user-attachments/assets/5cfbade7-2f6e-49ee-92f6-0e3ad846f971" width="600px">
```
terraform apply
```
<img alt="Terraform" src="https://github.com/user-attachments/assets/bd68ce05-5fe1-49e6-8ceb-81d942147dd0" width="600px">

