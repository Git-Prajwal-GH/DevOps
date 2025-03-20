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
# after cli terraform destroy u will see following details
/root@Terraform-server:~# terraform destroy
aws_vpc.myvpc: Refreshing state... [id=vpc-0a54d64027c17944e]
aws_internet_gateway.myigw: Refreshing state... [id=igw-05c9c87f8c15668b3]
aws_subnet.subnet_1: Refreshing state... [id=subnet-0dec6497e467d3632]
aws_route_table.public_route_table: Refreshing state... [id=rtb-08983edc7722d1e29]
aws_subnet.subnet_2: Refreshing state... [id=subnet-09a747d3788a28f5b]
aws_route.public_route: Refreshing state... [id=r-rtb-08983edc7722d1e291080289494]
aws_route_table_association.public_subnet_associate: Refreshing state... [id=rtbassoc-07ef918e38fdcd291]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_internet_gateway.myigw will be destroyed
  - resource "aws_internet_gateway" "myigw" {
      - arn      = "arn:aws:ec2:us-east-1:762233730669:internet-gateway/igw-05c9c87f8c15668b3" -> null
      - id       = "igw-05c9c87f8c15668b3" -> null
      - owner_id = "762233730669" -> null
      - tags     = {
          - "Name" = "MyIGW"
        } -> null
      - tags_all = {
          - "Name" = "MyIGW"
        } -> null
      - vpc_id   = "vpc-0a54d64027c17944e" -> null
    }

  # aws_route.public_route will be destroyed
  - resource "aws_route" "public_route" {
      - destination_cidr_block      = "0.0.0.0/0" -> null
      - gateway_id                  = "igw-05c9c87f8c15668b3" -> null
      - id                          = "r-rtb-08983edc7722d1e291080289494" -> null
      - origin                      = "CreateRoute" -> null
      - route_table_id              = "rtb-08983edc7722d1e29" -> null
      - state                       = "active" -> null
        # (13 unchanged attributes hidden)
    }

  # aws_route_table.public_route_table will be destroyed
  - resource "aws_route_table" "public_route_table" {
      - arn              = "arn:aws:ec2:us-east-1:762233730669:route-table/rtb-08983edc7722d1e29" -> null
      - id               = "rtb-08983edc7722d1e29" -> null
      - owner_id         = "762233730669" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-05c9c87f8c15668b3"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Name" = "Public Route Table"
        } -> null
      - tags_all         = {
          - "Name" = "Public Route Table"
        } -> null
      - vpc_id           = "vpc-0a54d64027c17944e" -> null
    }

  # aws_route_table_association.public_subnet_associate will be destroyed
  - resource "aws_route_table_association" "public_subnet_associate" {
      - id             = "rtbassoc-07ef918e38fdcd291" -> null
      - route_table_id = "rtb-08983edc7722d1e29" -> null
      - subnet_id      = "subnet-0dec6497e467d3632" -> null
        # (1 unchanged attribute hidden)
    }

  # aws_subnet.subnet_1 will be destroyed
  - resource "aws_subnet" "subnet_1" {
      - arn                                            = "arn:aws:ec2:us-east-1:762233730669:subnet/subnet-0dec6497e467d3632" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.0.0.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0dec6497e467d3632" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "762233730669" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Name" = "Public Subnet"
        } -> null
      - tags_all                                       = {
          - "Name" = "Public Subnet"
        } -> null
      - vpc_id                                         = "vpc-0a54d64027c17944e" -> null
        # (4 unchanged attributes hidden)
    }

  # aws_subnet.subnet_2 will be destroyed
  - resource "aws_subnet" "subnet_2" {
      - arn                                            = "arn:aws:ec2:us-east-1:762233730669:subnet/subnet-09a747d3788a28f5b" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1b" -> null
      - availability_zone_id                           = "use1-az4" -> null
      - cidr_block                                     = "10.0.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-09a747d3788a28f5b" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "762233730669" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Name" = "Private Subnet"
        } -> null
      - tags_all                                       = {
          - "Name" = "Private Subnet"
        } -> null
      - vpc_id                                         = "vpc-0a54d64027c17944e" -> null
        # (4 unchanged attributes hidden)
    }

  # aws_vpc.myvpc will be destroyed
  - resource "aws_vpc" "myvpc" {
      - arn                                  = "arn:aws:ec2:us-east-1:762233730669:vpc/vpc-0a54d64027c17944e" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-03436b09adacda105" -> null
      - default_route_table_id               = "rtb-0c84cb0956c8aeca7" -> null
      - default_security_group_id            = "sg-0d45765cb7c8fa610" -> null
      - dhcp_options_id                      = "dopt-0fbf552b368360883" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-0a54d64027c17944e" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-0c84cb0956c8aeca7" -> null
      - owner_id                             = "762233730669" -> null
      - tags                                 = {
          - "Name" = "MyVPC"
        } -> null
      - tags_all                             = {
          - "Name" = "MyVPC"
        } -> null
        # (4 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 7 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_route_table_association.public_subnet_associate: Destroying... [id=rtbassoc-07ef918e38fdcd291]
aws_subnet.subnet_2: Destroying... [id=subnet-09a747d3788a28f5b]
aws_route.public_route: Destroying... [id=r-rtb-08983edc7722d1e291080289494]
aws_route_table_association.public_subnet_associate: Destruction complete after 0s
aws_subnet.subnet_1: Destroying... [id=subnet-0dec6497e467d3632]
aws_route.public_route: Destruction complete after 0s
aws_internet_gateway.myigw: Destroying... [id=igw-05c9c87f8c15668b3]
aws_route_table.public_route_table: Destroying... [id=rtb-08983edc7722d1e29]
aws_subnet.subnet_2: Destruction complete after 0s
aws_internet_gateway.myigw: Destruction complete after 0s
aws_subnet.subnet_1: Destruction complete after 0s
aws_route_table.public_route_table: Destruction complete after 0s
aws_vpc.myvpc: Destroying... [id=vpc-0a54d64027c17944e]
aws_vpc.myvpc: Destruction complete after 1s

Destroy complete! Resources: 7 destroyed./
