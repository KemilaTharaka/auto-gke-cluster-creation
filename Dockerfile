FROM node:10-alpine

WORKDIR /app

COPY package.json /app/

RUN apk update && apk add curl curl-dev

# Install Pulumi
RUN curl -sSL https://get.pulumi.com/ | sh -s -- --version 0.14.2

# Add Pulumi to the $PATH
ENV PATH="/root/.pulumi/bin:${PATH}"

RUN npm install 

COPY . . /app/

ENTRYPOINT [ "pulumi","up" ]
# CMD [ "executable" ]