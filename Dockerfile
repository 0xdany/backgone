# Use a compatible base image
FROM node:18-slim AS nodebuild

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the Tailwind CSS (if needed)
RUN npm run build:css

# Remove development dependencies
RUN npm prune --production

# Use a compatible base image for the final stage
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code from the nodebuild stage
COPY --from=nodebuild /app /app

# Install Node.js (including npm)
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create the directory for the model file
RUN mkdir -p /root/.u2net

# Download the model file
RUN curl -L -o /root/.u2net/u2net.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx

# Set environment variable for PORT
ENV PORT=8080

# Expose the port the app runs on
EXPOSE 8080

# Start the Node.js server
CMD ["node", "server.js"]
