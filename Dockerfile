# Use an official Node.js image as the base
FROM node:18 AS nodebuild

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Tailwind CSS (if needed)
RUN npm run build:css

# Use an official Python image as the base for the final stage
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt ./

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the application code from the nodebuild stage
COPY --from=nodebuild /app /app

# Install Node.js (including npm)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Create the directory for the model file
RUN mkdir -p /root/.u2net

# Download the model file to the correct location
RUN wget -O /root/.u2net/u2net.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx

# Expose the port the app runs on
EXPOSE 3000

# Start the Node.js server
CMD ["npm", "run", "dev"]
