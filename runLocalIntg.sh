#!/usr/bin/env bash
#
# Commands:
# - build:   builds all the required images
# - destroy: stop instance and delete containers. This does not delete the image.
# - run:     run instance by replacing all running containers.
# - status:  check the status of the instance.
#
######################################################################

if [ $1 = "run" ]; then
   export IID=${2? app container ID not supplied}
   export HOST_PORT=${3? ssh contianer host port not supplied}
   echo "Running mlflow..."
fi

function apprm() {
    local container=$1

    echo "Removing container ${container}..."
    test $(docker ps -a | grep ${container} | wc -l) -ge 1 && docker rm -f ${container}
}

function app() {
    apprm "darkt-mlflow-tracking"
    docker run -d \
    --rm \
    --name darkt-mlflow-tracking-server \
    -p ${HOST_PORT}:${HOST_PORT} \
    -e PORT=${HOST_PORT} \
    -e FILE_DIR=/mlflow \
    -e ARTIFACTS=/artifacts \
    ${IID}
    echo "Started mlflow listening to ports ${HOST_PORT}"
}

function build() {
    make local
}

function run() {
    app
}

function status() {
    docker ps | grep -E "darkt-mlflow-tracking"
}

function destroy() {
    apprm "darkt-mlflow-tracking"
}

function for_manifest() {
    fun_name=$1
    echo "Running ${fun_name}..."
    $fun_name
}

for_manifest ${1:-status}