FROM node:alpine
WORKDIR /app/project
COPY package*.json .
RUN npm ci
COPY . .
CMD ["npm", "start"]

