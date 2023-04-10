FROM node:alpine
WORKDIR /app/project
COPY package*.json .
RUN npm ci
EXPOSE 3000
COPY . .
CMD ["npm", "start"]

