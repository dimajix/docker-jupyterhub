#!/bin/bash
set -eo pipefail

# Setup environment
source /opt/docker/libexec/jupyterhub-init.sh


start_hub() {
    jupyterhub --config /etc/jupyter/jupyterhub_config.py
}


main() {
    case "$1" in
        "jupyterhub")
            start_hub
            exit $?
            ;;
        *)
            exec $@
            exit $?
            ;;
    esac
}


main "$@"
