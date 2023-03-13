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
  
# Network
  Bridge network named YOLO_NET created
  use the following command to run it
   
   `docker run -d --net=YOLO_NET`
