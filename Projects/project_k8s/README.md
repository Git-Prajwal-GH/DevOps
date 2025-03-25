# LAUNCHING INSTANCE USING TERRAFORM SCRIPT & KUBERNETES INSTALLATION STEPS

### 1/1 THIS SCRIPT IS CREATED USING VS CODE & LAUNCHED IN VS TERMINAL

```
provider "aws" {
    region = "us-east-1"              # add region
    access_key = "***"                # add IAM console>users>security-credentials
    secret_key = "***"                # add IAM console>users>security-credentials
}

resource "aws_instance" "admin" {
        ami = "ami-084568db4383264d4"            # copy from AMI catalog which is displayed
        instance_type = "t2.medium"              # choose "t2.medium" instance
        security_groups = [ "default" ]          # set security group as default
        key_name = "terraform"                   # Give keypair
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
```

### 1/2 VS CODE FILE CREATING
- CLONE THE REPOSITORY URL IN VS CODE
- CREATE FOLDER & FILE 
- PASTE THE SCRIPT IN FILE - main.tf
- SAVE IT

### 1/3 VS CODE TERMINAL STEPS
- LOCATE TO EXECT LOCATION RUN THE CLI :
```
terraform init
```
```
terraform validate
```
```
terraform plan
```
```
terraform apply
```
- TERRAFORM APPLY ASK YES - TYPE YES 
- OUTPUT PUBLIP IP SHOWN - COPY IT & DO SSH CONNECTION

<img alt="Terraform" src=" " width="500px">

### 1/4 AFTER SSH CONNECTION RUN BELOW CLI
```
sudo su -
```

<img alt="Terraform" src=" " width="500px">

```
git clone 
```
```
ls
```
```
cd kubernetes-docs
```

<img alt="Terraform" src=" " width="500px">

```
sh Docker-install-ubuntu.sh
```

<img alt="Terraform" src=" " width="500px">

```
sh virtualbox-setup.sh
```
- WHEN SCREEN APPEARS CHOOSE 'OK' & NEXT SCREEN 'YES' FOR LICENSE APPROVAL
```
sh minikube-install.sh
```
<img alt="Terraform" src=" " width="500px">
```
exit
```
# 1/4 -ADDING THE USER MINI KUBE TO GROUP
```
sudo usermod -aG docker $USER && newgrp docker
```

<img alt="Terraform" src=" " width="500px">

```
minikube start --driver=docker
```

<img alt="Terraform" src=" " width="500px">

```
kubectl get ns
```
- here displayed the default setup of control panel components 
```
kubectl get pods -n kube-system
```
<img alt="Terraform" src=" " width="500px">
- 
- 