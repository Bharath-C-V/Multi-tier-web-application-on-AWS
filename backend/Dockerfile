# Dockerfile for Node.js app
FROM node:14
WORKDIR /app
COPY ./backend/package.json ./backend/package-lock.json ./
RUN npm install
COPY ./backend ./
EXPOSE 3000
CMD ["node", "app.js"]
