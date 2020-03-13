#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

jx step create pr regex --regex "variable\s\"request_versions_git_ref\"\s{\n\s\sdefault\s\s\s\s\s=\s\"(.*)\"" --version "v${VERSION}" --files "workspace-template/variables.tf" --repo https://github.com/cloudbees/arcalos-instance-template

sed 's:^.*\[jenkins-x/jenkins-x-builders\].*\[\([0-9.\-]*\)\].*$:\1:;t;d' dependency-matrix/matrix.md
