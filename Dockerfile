FROM node:14.9.0-alpine3.11

ENV KUBE_LATEST_VERSION="v1.19.2"

RUN apk add --no-cache ca-certificates bash git openssh-client openssh curl openjdk8-jre \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && chmod g+rwx /root \
    && mkdir /config \
    && chmod g+rwx /config

RUN npm install -g @openapitools/openapi-generator-cli

CMD ["sh"]