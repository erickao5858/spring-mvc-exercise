# Spring MVC Example - Library

## Features
- Basic CRUD operations with entity Book
- Sorting and filtering with pure front-end technology

## Tech
- Spring MVC
- Hibernate
- JPA 2
- MySQL
- Docker

## Installation
This project requires Docker Engine v1.13.0+, and Docker Compose v1.25.0+ to run. 

### Docker Engine
Update the apt package index and install packages to allow apt to use a repository over HTTPS:
```sh
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
Add Docker’s official GPG key:
```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
Use the following command to set up the stable repository:
```sh
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Install Docker Engine:
```sh
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
Verify Docker Engine is installed correctly by running the hello-world image:
```sh
sudo docker run hello-world
```
### Docker Compose
Install Docker Compose:
```sh
sudo apt install docker-compose
```
Verify Docker Compose is installed correctly by checking the version:
```sh
docker-compose --version
```
## Deploy the services
Clone the repo to desired location:
```sh
git clone https://github.com/erickao5858/spring-mvc-exercise <destination>
cd spring-mvc-exercise
```
Build image with docker and run:
```sh
docker build -t library .
docker-compose up -d
```
## Finish
[Default Page](http://localhost:8080/library/book/)