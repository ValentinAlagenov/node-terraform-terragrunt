FROM node:17-alpine

RUN apk add --no-cache \
  python3 \
  py-pip \
  py-setuptools \
  ca-certificates \
  openssl \
  groff \
  less \
  bash \
  curl \
  jq \
  git \
  zip && \
  pip install --no-cache-dir --upgrade pip awscli && \
  aws configure set preview.cloudfront true

ENV TERRAFORM_VERSION 1.1.7

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform.zip -d /usr/local/bin && \
  rm -f terraform.zip

RUN curl -S 'https://github.com/gruntwork-io/terragrunt/releases/download/v0.23.39/terragrunt_linux_amd64' -o /usr/bin/terragrunt -L && chmod a+x /usr/bin/terragrunt

RUN curl -s -L 'https://github.com/open-policy-agent/opa/releases/download/v0.23.2/opa_linux_amd64' -o /tmp/opa &&  mv -f /tmp/opa /usr/bin/opa && chmod a+x /usr/bin/opa

ENTRYPOINT ["/bin/bash", "-c"]