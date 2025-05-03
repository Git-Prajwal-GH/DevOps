## Pre-requisites
### Ec2-Instances:
- AMI: Ubuntu AMI
- type: t2.medium
- Key_pair
- Network: Default VPC
- Security Group: TCP-SSH

### Git:
```
sudo apt-get install git
```

### Jenkins:
- Step 1: Java setup
```
sudo apt update
sudo apt install fontconfig openjdk-21-jre
java -version
```

- Step 2: Jenkins install
```
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo apt-get status jenkins
```

- anable jenkins on web <public_ip>:8080 # 8080 jenkins default port

### SonarQube:
- Step 1: Add user to group
```
aaduser sonarqube # set up with password
```
- Step 2: install unzip
```
apt-get install unzip
```
- Step 3: Switch to user sonarqube
```
su - sonarqube
```
- Step 4: unzip the files
```
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip
unzip *
chmod -R 755 /home/sonarqube/sonarqube-9.4.0.54424
chown -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.4.0.54424
cd sonarqube-9.4.0.54424/bin/linux-x86-64/
./sonar.sh start
```
- Step 4: anable SonarQube on web <public_ip>:9000 # 9000 SonarQube default port

### Docker:
```
sudo apt-get install docker.io
```

### Trivy:
referal link:https://trivy.dev/v0.43/getting-started/installation/
```
wget https://github.com/aquasecurity/trivy/releases/download/v0.43.1/trivy_0.43.1_Linux-64bit.deb
sudo dpkg -i trivy_0.43.1_Linux-64bit.deb
```
