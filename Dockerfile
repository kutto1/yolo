FROM node:alpine
WORKDIR /app/project
COPY package*.json /usr/src/app
RUN npm install
COPY . .
CMD ["npm", "start"]

