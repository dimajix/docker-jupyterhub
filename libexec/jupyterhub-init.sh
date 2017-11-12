#!/usr/bin/env bash
set -eo pipefail

# Setup environment
source /opt/docker/libexec/common.sh
source /opt/docker/libexec/jupyterhub-vars.sh

render_templates /opt/docker/conf/jupyterhub /etc/jupyter

