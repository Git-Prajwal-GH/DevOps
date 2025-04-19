## Pre-requisites AWS setup
- Ec2 instances t2.medium
- Network SSH, TCP 
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
<img src= "https://github.com/user-attachments/assets/56ac27dd-521c-47f6-933e-bb4387690215
" width="400px">

# OR

## Jenkins login in web
1. Open web browser
2. In url path type > hostip:8080 ( ex:125.65.85.04:8080 )

## Copy the passcode in empty given path
<img src= "Screenshot 2025-03-19 093539.png" width="400px">

## Select Install suggested plugins
<img src= "dikjkio.jpg" width="400px">

## Wait to load all default plugins
<img src= "Screenshot 2025-03-15 164336.png" width="400px">

## Setup a first demo login password
<img src= "Screenshot 2025-03-15 164512.png" width="400px">

## Successfully logined to jenkins
![alt text](<Screenshot 2025-03-19 093413.png>)
