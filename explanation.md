# Containerization - docker-compose.yml
  We have created 2 containers 
  1. Mongo DB 
  2. Node API: where the app will run

# Dockerfile
  node:alpine latest image used for small image size
  WORKDIR - directory where app will be running
  COPY - package.json copied to container
  RUN npm ci - Recommended by docker references to install dependencies exactly as is locally
  COPY from local to container\
  CMD npm start to start the app

  # Docker Hub 
   Use the command below to pull from my Docker Hub repo
     
       `docker pull kutto1/yolo:0.0.2.RELEASE`

  # Start the App

   ## Requirements
Make sure that you have the following installed:
- [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04) 
- npm 
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`


     ### Run
     `sudo docker build .`

      then
    
     `sudo docker compose up`

# IP3 Configuration Management - Ansible Instrumentation

The approach used was to set up the ansible environment by creating the following; 

* inventory - contains virtual server IP address which the project is to be implemented on- this is how we can connect to the vagrant server using ansible
* ansible.cfg - ansible file configurations are defined here 
* The main playbook file `main-playbook.yaml` which contains 3 roles defined:

    1. install-docker role: this handle the tasks to install docker and it's dependencies as well as docker SDK.
    2. install-app role: this handles the tasks of containerization of all components into microservices.
    3. watchtower-role: this deploys watchtower which is a service that automatically updates all running containers in the service

 Volumes have been used within the roles creation to ensure persistence of the instances

 Vagrantfile was created to be used in setting up the desired remote environment/server/VM with guidelines on each instructions.


   ## Installations

  Run the following command to install ansible
  `python3 -m pip install ansible`

  Run the following command to install docker galaxy which enables management of docker with ansible
  `ansible-galaxy collection install community.docker`

  Run the following command to install ansible
  `python3 -m pip install ansible`

  Run the following command to run vagrant and start the VM
  `vagrant up`

  To run the ansible playbook execute following command in the shell 
  `ansible-playbook main-playbook.yaml`




