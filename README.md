DevOpsify the wisecow-web application

The main goal of this project is to implement DevOps practices in the wisecow-web application. The project is a simple website written using the cawsay maodule.

DevOps practices include the following:

    Creating Dockerfile 
    Containerization
    Continuous Integration (CI)
    Continuous Deployment (CD)

Creating Dockerfile 

The Dockerfile is used to build a Docker image. The Docker image contains the wisecow-web application and its dependencies. The Docker image is then used to create a Docker container.


Containerization is the process of packaging an application and its dependencies into a container. The container is then run on a container platform such as Docker. Containerization allows you to run the application in a consistent environment, regardless of the underlying infrastructure.

We will use Docker to containerize the wisecow-web application. Docker is a container platform that allows you to build, ship, and run containers.

Commands to build the Docker container:

	docker build -t <your-docker-username>/wisecow .

Command to run the Docker container:

	docker run -p 4499:4499 <your-docker-username>/wisecow

Command to push the Docker container to Docker Hub:

	docker push <your-docker-username>/wisecow:latest

TO Run this Containerize application you can use below pull command to pull the images and directly run a container using that image

	docker pull balajif5/wisecow

TO RUN Container use below commnad :

	docker run -p 4499:4499 balajif5/wisecow:latest

you can also expose to other port using the different port 
 

Create Kubernetes manifests

We have created kubernetes Manifest files to depoly this to kubernetes cluster.

	deployment.yml
	service.yml 


Set up GitHub Action

we have used github action to setup CI-CD workflow

	CI_CD_Config.yml

Continuous Integration (CI) and Continuous deployment
Continuous Integration (CI) and Continuous deployment is the practice of automating the integration of code changes into a shared repository. CI helps to catch bugs early in the development process and ensures that the code is always in a deployable state.


Enable secure TLS communication

we have created the ingress manifest filw to enable the secure TLS communication

	ingress.yml

Steps to Enable TLS as follows :

Create a trusted certificate using mkcert:

   mkcert -install
   mkcert wisecow.local 


Create a Kubernetes secret for the certificate:

	kubectl create secret tls wisecow-tls --key wisecow.local-key.pem --cert wisecow.local.pem


Apply the ingress manifest:

	kubectl apply -f ingress.yaml



Update your /etc/hosts file to point to the Kubernetes node IP address:

	echo "<node-ip> wisecow.local" >> /etc/hosts



Access the Wisecow application using HTTPS:

	https://wisecow.local:4499


This should give you a secure connection to the Wisecow application. 

***Note : You may need to accept the self-signed certificate warning in your browser.
