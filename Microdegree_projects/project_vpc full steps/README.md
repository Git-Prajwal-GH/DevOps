# VPC/SUBNETS/IGW/ROUTETABLES CREATING STEPS USING 'TERRAFORM' 

# Launch the EC2 instance 
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

# INSTANCE CONNECT USING :
- USING SSH CLIENT INTO THE WINDOWS TERMINAL
<img alt="Terraform" src="https://github.com/user-attachments/assets/a7b35743-f7f2-46d8-8acc-22d50d6e48ed" width="600px">

- # Switch to root user
```
sudo su -
```
- # Switch to server
```
hostname terraform-server
bash
apt update && apt upgrade
```
# Install terraform web source
- website link: https://developer.hashicorp.com/terraform/install

# OR
- # use this cli cmd 
```
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

- # Confirm terraform is available
```
terraform --version
```

<img alt="Terraform" src="https://github.com/user-attachments/assets/05b6099e-100e-4090-8962-031c1649ecaa" width="600px">

- # Run this cli cmd 
```
mkdir vpc
cd vpc
vi main.tf
```

- # add the created script in vi main.tf

```
provider "aws" {
  region     = "us-east-1"
  access_key = "****"       # place your user IAM credentials access key from user
  secret_key = "****"       # place your user IAM credentials access key from user
}

# CREATING THE VPC
resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "MyVPC"
  }
}

# CREATING THE FIRST SUBNET (Public SUBNET)
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# CREATING THE SECOND SUBNET (Private SUBNET)
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false  # Private subnet should not map public IP

  tags = {
    Name = "Private Subnet"
  }
}

# CREATING THE INTERNET GATEWAY
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "MyIGW"
  }
}

# CREATING THE PUBLIC ROUTE TABLE
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Public Route Table"
  }
}

# CREATING A ROUTE FOR THE PUBLIC SUBNET
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id
}

# ASSOCIATING PUBLIC ROUTE TABLE WITH PUBLIC SUBNET
resource "aws_route_table_association" "public_subnet_associate" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}
```

```
terraform init
```

<img alt="Terraform" src="https://github.com/user-attachments/assets/41e63ce3-d22b-4ea1-abf1-43eb0b2d43ef" width="600px">

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

```
terraform apply   # type yes(Enter in value)
```

- # BEFORE typing yes
<img alt="Terraform" src="https://github.com/user-attachments/assets/901febe9-38b9-41fe-9089-160ef4b8a430" width="600px">

- # AFTER typing yes refresh the console
- # OUTPUT
# VPC
<img alt="Terraform" src="https://github.com/user-attachments/assets/aa70c55e-c5d4-4822-902a-a2fdd68f7ca8" width="600px">

# Subnets
<img alt="Terraform" src="https://github.com/user-attachments/assets/b7212be1-7460-4b6d-a1f7-d69e43635b9c" width="600px">

# Internet gateway
<img alt="Terraform" src="https://github.com/user-attachments/assets/6a9da92d-5ecd-4769-b58d-d24d7650658e" width="600px">

# Route tables
<img alt="Terraform" src="https://github.com/user-attachments/assets/223947a1-592f-4e02-9ec1-00a29f7ed440" width="600px">

# To delete the created VPC 
```
terraform destroy
```
