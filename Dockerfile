# Step 1: Build the React application
FROM node:16 as build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./
# If you're using yarn, uncomment the next line
# COPY yarn.lock ./

# Install dependencies
RUN npm install
# If you're using yarn, replace the above command with:
# RUN yarn install

# Copy the rest of your app's source code
COPY . .

# Build your app
RUN npm run build
# If you're using yarn, replace the above command with:
# RUN yarn build

# Step 2: Set up the server to serve the app
FROM nginx:stable-alpine

# Copy the build output to replace the default nginx contents.
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to the outside once the container is launched
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
