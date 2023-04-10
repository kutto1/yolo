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



# IP4 Orchestration

All the K8s related manifests have been grouped into the K8s folder

I used the following manifest and services to deploy the appliaction in the k8s cluster;
  1. Deployment- using the `yolo-deployment.yaml` manifest file to create the pod for the nodejs yolo application. 
     This is because it is a stateless application.
     This is used to build the app into a docker image. The following has been defined to K8s on the app we want to create;
      - The kind (type of K8s object resource used)
      - Names/Labels used for identification
      - Replicas defined to increase availability 
      - Image pull policy defined to `IfNotPresent` so that the image is pulled from Docker hub only once then from there only when not available.

    * This is linked by it's name/label to the `Nodeport-svc.yaml` file which creates a Nodeport service that is used to expose the app to the internet 
      

  2. Statefulset K8s object was used for database storage for data consistency - the `mongo-statefulset.yaml` manifest file is used to create the image of the mongodb and set up replicas to increase avaialbily.
  Reasons: 
      - Pods are created one by one in order for the data to synchronize from the master to the slave nodes
      - volumeClaimTemplates for persistent volume for each replica pod seperately to avoid data inconsistency
      - Use of the sticky identity assigned to each pod that is created for a consistent and predicatable identity to keep track easier
        even on delete or restart
      - Scaling is easier considering it is a online shopping app so traffic on the app might increase or decrease.

    * A headless service is created for this in order to enable talking to a specific node intead of balancing loads across all the nodes
       - each pod gets it's specific DNS entries



   ## Instructions
  1. After cloning the repository from Github, Update and install the gcloud CLI
  2. Command-line access - connection to the GKE cluster
      Configure kubectl command line access by running the following command:

          `gcloud container clusters get-credentials yolo-cluster-1 --region us-central1 --project yolo-app-383316`
          
  3. I ran the manifests for object pod and services creation

        `kubectl apply -f yolo-deployment.yaml`

        `kubectl apply -f mongo-statefulset.yaml`

        `kubectl apply -f headless-svc.yaml`

        `kubectl apply -f Nodeport-svc.yaml`

   4. Insert ExternalIP:targetport to access the application

         `http://35.188.159.56:3000/`

         




