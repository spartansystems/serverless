FROM python:2.7.13

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN mkdir /root/.aws

RUN curl -s https://bootstrap.pypa.io/get-pip.py | python
RUN pip install \
    awscli \
    pep8 \
    pytest \
    pytest-cov \
    pytest-mock \
    pytest-watch \
    boto3

ARG SERVERLESS_VERSION
RUN npm install -g \
    serverless@${SERVERLESS_VERSION} \
    yarn

RUN echo "alias ll='ls -alFh --color=auto'" >> /root/.bashrc
RUN echo "alias l='ls -alFh --color=auto'" >> /root/.bashrc

RUN mkdir /code
WORKDIR /code
