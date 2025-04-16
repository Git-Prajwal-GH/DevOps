```
# Define the content
title = "Kubernetes Setup on AWS EC2 (t2.micro) with kubeadm"
content = 
✅ Step 1: Launch EC2 Instance
- AMI: Ubuntu 22.04
- Type: t2.micro (Free Tier)
- Ports to open in security group:
  - TCP 22 (SSH)
  - TCP 6443 (Kubernetes API)
  - TCP 10250 (kubelet)
  - Any other ports needed by your CNI (Flannel, Calico, etc.)
- Key Pair: Save your .pem file

✅ Step 2: SSH Into EC2
ssh -i your-key.pem ubuntu@your-ec2-public-ip

✅ Step 3: Disable Swap
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab

✅ Step 4: Install Docker
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

✅ Step 5: Install kubeadm, kubelet, kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

✅ Step 6: Initialize Kubernetes Cluster
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

✅ Step 7: Set Up kubeconfig for User
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

✅ Step 8: Install Pod Network (Flannel)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

✅ Step 9: Verify
kubectl get nodes
kubectl get pods --all-namespaces

✅ Bonus: Deploy a Sample App
kubectl create deployment nginx --image=nginx
kubectl expose deployment nginx --port=80 --type=NodePort
kubectl get svc
```
