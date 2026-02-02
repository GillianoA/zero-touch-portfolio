# We use Node.js to build the React application
FROM node:22-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker caching (faster builds)
COPY package*.json ./

# Install dependencies strictly based on the lock file
RUN npm ci

# Copy the rest of the source code
COPY . .

# Build the static files (creates a 'dist' folder)
RUN npm run build

# --- Stage 2: The Delivery Truck (Production) ---
# We use Nginx to serve the static files
FROM nginx:alpine

# Copy only the built files from the previous stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]