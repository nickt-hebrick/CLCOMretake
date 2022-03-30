# This is a comment.

# Layer 1: start with an existing base image
# We use a minimal Linux with Node.js installed.
FROM node:12-alpine

# Layer 2: install additional required packages for our app
RUN apk add --no-cache python3 g++ make

# Layer 3: Create an "app" directory inside your image 
# and set it as the current working directory
WORKDIR /app

# Layer 4: Copy the local contents into the working directory of the image
COPY . .

# Layer 5: Run yarn (installs all app dependencies defined in package.json)
RUN yarn install

# This is what we run when a container based on our image is started,
# it is not executed at build time!
# There can only be one CMD instruction in a Dockerfile.
CMD ["node", "src/index.js"]