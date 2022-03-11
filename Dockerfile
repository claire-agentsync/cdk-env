FROM ubuntu:20.04

ADD https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh /tmp/
ADD https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip /tmp/awscli.zip

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y install python3 python3-pip git curl zip \
    && chmod 755 /tmp/install.sh \
    && bash /tmp/install.sh \
    && export NVM_DIR=${HOME}/.nvm \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  \
    && nvm install --lts \
    && unzip /tmp/awscli.zip \
    && ./aws/install \
    && pip3 install pipenv \
    && cd /code; pipenv install boto3
