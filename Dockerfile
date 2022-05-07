# ARG GAME_CI_UNITY_EDITOR_IMAGE

#FROM ubuntu:18.04 AS blenderbuild

#FROM nytimes/blender:latest

# inject ruby and additional dependencies in game-ci's unity editor image
# FROM $GAME_CI_UNITY_EDITOR_IMAGE
FROM unityci/editor:ubuntu-2020.3.28f1-webgl-1.0.1

RUN apt-get update \
&&  apt-get upgrade -y --force-yes \
&&  apt-get install -y --force-yes \
	blender \
&&  apt-get clean \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

#RUN apt-get update && \
    #apt-get install -y \
        #git \
        #curl \
        #gcc \
        #make \
        #libssl-dev \
        #zlib1g-dev \
        #libsqlite3-dev
#COPY --from=rubybuild $RUBY_PATH $RUBY_PATH
