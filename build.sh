#!/usr/bin/env bash

set -ex

UNITY_VERSION=2020.3.28f1
GAME_CI_VERSION=1.0.1 # https://github.com/game-ci/docker/releases
MY_USERNAME=ytkimirti

# don't hesitate to remove unused components from this list
declare -a components=("android" "webgl" "windows-mono")

for component in "${components[@]}"
do
  GAME_CI_UNITY_EDITOR_IMAGE=unityci/editor:ubuntu-${UNITY_VERSION}-${component}-${GAME_CI_VERSION}
  IMAGE_TO_PUBLISH=${MY_USERNAME}/editor:ubuntu-${UNITY_VERSION}-${component}-${GAME_CI_VERSION}
  docker build --build-arg GAME_CI_UNITY_EDITOR_IMAGE=${GAME_CI_UNITY_EDITOR_IMAGE} . -t ${IMAGE_TO_PUBLISH}
# uncomment the following to publish the built images to docker hub
#  docker push ${IMAGE_TO_PUBLISH}
done
