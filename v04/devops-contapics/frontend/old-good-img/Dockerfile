# frontend/Dockerfile
FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# ENV VITE_BACKEND_URL=http://localhost:8080 old
RUN npm run build
 
FROM nginx:alpine
# Copy built files
COPY --from=build /app/dist /usr/share/nginx/html

# Copy env template
COPY env.template.js /usr/share/nginx/html/env.template.js

# Startup script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Expose port
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]