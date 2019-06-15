FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

# /app/build <-- all the stuff we care about inside container directory

# run phase - nginx

FROM nginx 
# copy something from different phase
COPY --from=builder /app/build /usr/share/nginx/html




