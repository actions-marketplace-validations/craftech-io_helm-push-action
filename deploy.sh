#!/usr/bin/env bash

helm plugin install https://github.com/chartmuseum/helm-push.git
if [ ! -z ${REPO_USERNAME} ] && [ ! -z ${REPO_PASSWORD} ]; then
  AUTH_OPTIONS="--username=\"${REPO_USERNAME}\" --password=\"${REPO_PASSWORD}\""
fi  
helm repo add $AUTH_OPTIONS ${CHART_REPO_NAME} ${CHART_REPO_URL}
cd ${CHART_DIR}
helm dependency update
helm cm-push . ${CHART_REPO_NAME}