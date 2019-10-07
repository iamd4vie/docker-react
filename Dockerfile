#Multi step process
#"as" to Tag the phase as builder
#output is the build folder in the working directory
FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

#new block 
FROM nginx as run
#copy specific folder/s from the builder phase
COPY --from=builder /app/build /usr/share/nginx/html




