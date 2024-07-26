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

Continuous Integration (CI) and Continuous deployment

Continuous Integration (CI) and Continuous deployment is the practice of automating the integration of code changes into a shared repository. CI helps to catch bugs early in the development process and ensures that the code is always in a deployable state.
