# Ansible installing
### steps:- 
1) LAUNCH 3 EC2 INSTANCES (LET SAY 1 IS FOR MASTER AND 2 IS FOR WORKERS)
2) MAKE PASSWORDLESS CONNECTION/W MASTER AND WORKERS
3) NOW WE HAVE TO INSTALL ANSBILE TOOL ON MASTE-NODE
4) NOW WE HAVE TO ADD A WORKER-NODES IP's ON MASTER-NODE INVENTORY FILE
5) NOW WE HAVE TO CHECK CONNECTION B/W MASTER AND WORKER NODE USING MODULE

### 1) LAUNCH 3 EC2 INSTANCES (LET SAY 1 IS FOR MASTER AND 2 IS FOR WORKERS)
- Prerequisite
- AMI: Ubuntu
- type: t2.micro
- SecurityGroup: 1.tcp-ssh
  		 2.All traffic
- EBS: 8GB Gp3

### 2) MAKE PASSWORDLESS CONNECTION/W MASTER AND WORKERS
MASTER:-
- 1.go to root user 
- 2.ssh-keygen 
- 3.type enter without giving any input 
- 4.ls -a 
- 5.cd .ssh 
- 6.ls 
- 7.cat id_rsa.pub = copy the content

WORKER1:- 
- 1.cd .shh
- 2.ls
- 3.cat authorized_keys = paste the content copied from MASTER

WORKER2:- 
- 1.cd .shh
- 2.ls
- 3.cat authorized_keys = paste the content copied from MASTER

MASTER:- 
- 1.ssh root@<ip_server1> #login to server1
- 2. exit
- 3. SAME FOR server2  ssh root@<ip_server2> #login to server2
- 4. exit

### 3) NOW WE HAVE TO INSTALL ANSBILE TOOL ON MASTE-NODE
```
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible 
```
### 4) NOW WE HAVE TO ADD A WORKER-NODES IP's ON MASTER-NODE INVENTORY FILE
```
vi /etc/ansible/hosts 
```

- search EX:1 then end of the it then enter to NXT line paste this 
```
"server1 ansible_host=<worker1_ip> #paste ip in worker1_ip 
 server1 ansible_host=<worker2_ip>" #paste ip in worker2_ip
```
### ex 
<img alt="Image" src="https://github.com/user-attachments/assets/3f15b6cf-3fd8-4f27-9ab4-912c3fd12360" width="600px"> 

### 5) NOW WE HAVE TO CHECK CONNECTION B/W MASTER AND WORKER NODE USING MODULE
```
ansible all -m ping -u root # all means worker1 & 2 nodes
```
- OUTPUT
<img alt="Image" src="https://github.com/user-attachments/assets/942375e9-339b-4608-a89d-75b165a11f31" width="1000px"> 

### OR
```
ansible server1 -m ping -u root # confirm connection between master and worker1 nodes
```
ityititidtiit
