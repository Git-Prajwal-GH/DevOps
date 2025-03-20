# VPC CREATING STEPS IN TERRAFORM FORMAT

- launch the EC2 instance 
*AMI - ubuntu os
<img alt="Terraform" src="https://github.com/user-attachments/assets/9e22d554-b974-47d1-b290-4c7e0501e13e">
*instance type - t2.micro
*set key_pair
*choose vpc - deafault
*choose subnet - public
*public access - enable
*securiy group - default with ssh connection
*configuration storage - approx 20 GB and gp3
*launch the instance

INSTANCE CONNECT USING :
USING SSH CLIENT INTO THE WINDOWS TERMINAL

<img alt="Terraform" src="https://github.com/user-attachments/assets/a7b35743-f7f2-46d8-8acc-22d50d6e48ed">


``` 
# switch to root
sudo su -
```
```
# switch to server
hostname terraform-server
bash
apt update && apt upgrade
```
```
# install terraform
https://developer.hashicorp.com/terraform/install
```
```
# OR
# use this cli

wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
# check the version that will confirm terraform is available

terraform --version

