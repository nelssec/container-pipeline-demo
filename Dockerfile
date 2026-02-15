# Using an older Node.js image with known vulnerabilities
FROM node:14.17.0-alpine3.12

WORKDIR /app

# Install Python and pip with vulnerable packages
RUN apk add --no-cache python3 py3-pip gcc musl-dev python3-dev libffi-dev openssl-dev
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application code
COPY app.js ./

# Expose port
EXPOSE 3000

# Run the application
CMD ["node", "app.js"]
