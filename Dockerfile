FROM node:8

RUN apt-get update && \
    apt-get install -y awscli && \
    rm -rf /var/lib/apt/lists/*

CMD [ "node", "--version" ]
