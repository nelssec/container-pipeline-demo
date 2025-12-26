# Using an older Node.js image with known vulnerabilities
FROM node:14.17.0-alpine3.12

WORKDIR /app

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
