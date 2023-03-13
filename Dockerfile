FROM node:alpine
WORKDIR /app/project
COPY package*.json .
RUN npm ci
EXPOSE 5000
COPY . .
CMD ["npm", "start"]

