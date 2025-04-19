## Pre-requisites AWS setup
- AMI: Amazonlinux
- Type: t2.medium
- Ports to open in security group:
  - TCP 22 (SSH) 
- Key Pair: Save your .pem file
## link for Jenkins setup
https://pkg.jenkins.io/debian/

# OR
```
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
https://pkg.jenkins.io/debian binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install fontconfig openjdk-17-jre # Java installation
sudo apt-get install jenkins
sudo apt-get jenkins --version
sudo apt-get status jenkins
```

## Run this cli to check jenkins pass code
```
/var/lib/jenkins/secrets/initialAdminpassword
```

## Check instead to get Jenkins passcode with host port
<img alt="image" src="https://github.com/user-attachments/assets/56ac27dd-521c-47f6-933e-bb4387690215" width="500px">

# OR

## Jenkins login in web
1. Open web browser
2. In url path type > hostip:8080 ( ex:125.65.85.04:8080 )

## Copy the passcode in empty given path
<img alt="image" src="https://github.com/user-attachments/assets/86b48d97-e926-42b1-84c2-8dce6e4069ee" width="500px">

## Select Install suggested plugins
<img alt="image" src="https://github.com/user-attachments/assets/5dcef65c-849a-4cb6-bc78-ba51d4b67186" width="500px">

## Wait to load all default plugins
<img alt="image" src="https://github.com/user-attachments/assets/636d57b4-232b-4149-8395-e07c39e2e221" width="500px">

## Setup a first demo login password or select skip & continue as admin
- username > 'admin'
- password > 'passcode' (/var/lib/jenkins/secrets/initialAdminpassword)
<img alt="image" src="https://github.com/user-attachments/assets/c7c710b5-1393-493f-b42b-92f5632757a6" width="500px">

## Successfully logined to jenkins
<img alt="image" src="https://github.com/user-attachments/assets/7389a3cd-c2e3-49f2-8166-086bd6766756" width="500px">
