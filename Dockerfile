FROM node:alpine
WORKDIR /app/project
COPY package*.json .
RUN npm install
COPY . .
CMD ["npm", "start"]

