#!/usr/bin/env bash

WORKDIR=$(mktemp -u)
VERSION=$(yq .appVersion charts/db-operator/Chart.yaml)
CHART_VERSION=$(yq .version charts/db-operator/Chart.yaml)

git clone https://github.com/db-operator/db-operator.git "${WORKDIR}"
git -C "${WORKDIR}" checkout "${VERSION}"
rm -rf ./charts/db-operator/crd
cp -r "${WORKDIR}/config/crd/bases" ./charts/db-operator/crd
rm -rf "${WORKDIR}"
