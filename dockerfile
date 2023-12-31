FROM node:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y git && \
    npm install -g n && \
    n stable && \
    npm install -g pm2

# Clone and install the application
RUN git clone https://github.com/traptor/Bybit-Lick-Hunter-v4.git /app

WORKDIR /app

RUN apt-get update && apt-get install -y nano && \
    npm install

# Set environment variables for .env file
ENV FIRST_START=false

# Start the application with pm2
CMD ["pm2-runtime", "app.js"]