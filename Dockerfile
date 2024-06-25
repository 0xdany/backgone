# Use a slim version of the Node.js image as the base for the build stage
FROM node:18-slim AS nodebuild

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install all dependencies (including devDependencies)
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the Tailwind CSS
RUN npm run build:css

# Prune the devDependencies
RUN npm prune --production

# Use a slim version of the Python image as the base for the runtime stage
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code from the build stage
COPY --from=nodebuild /app /app

# Install Node.js (including npm) and necessary tools in a single layer
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create the directory for the model file and download it using curl
RUN mkdir -p /root/.u2net && \
    curl -L -o /root/.u2net/u2net.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx

# Expose the port the app runs on
EXPOSE 3000

# Set the command to run the application
CMD ["npm", "run", "start"]
