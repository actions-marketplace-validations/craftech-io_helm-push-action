FROM craftech/ci-tools:kube-tools-latest

# Install the toolset.
RUN apk update \
    && apk add bash git curl jq

# Copying helmfile binary and deploy.sh file
COPY deploy.sh /usr/local/bin/deploy

ENTRYPOINT deploy