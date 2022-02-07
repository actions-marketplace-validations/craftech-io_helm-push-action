#!/usr/bin/env bash

helm plugin install https://github.com/chartmuseum/helm-push.git
if [ ! -z ${REPO_USERNAME} ] && [ ! -z ${REPO_PASSWORD} ]; then
  helm repo add --username="${REPO_USERNAME}" --password="${REPO_PASSWORD}" ${CHART_REPO_NAME} ${CHART_REPO_URL}
else
  helm repo add ${CHART_REPO_NAME} ${CHART_REPO_URL}
fi  
cd ${CHART_DIR}
helm dependency update
helm cm-push . ${CHART_REPO_NAME}
