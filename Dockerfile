FROM node:lts-bullseye

ADD https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip /tmp/awscli.zip

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y install python3 python3-pip git curl zip vim \
    && npm install -g aws-cdk \
    && unzip /tmp/awscli.zip \
    && ./aws/install \
    && pip3 install pipenv \
    && pipenv install boto3 aws-cdk-lib

CMD ["cdk", "version"]
