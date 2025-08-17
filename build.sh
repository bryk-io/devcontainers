#!/bin/bash

registry=ghcr.io/bryk-io/
for dir in src/*/
do
  # get image details
  src=${dir%*/}
  img=${registry}`sed -n '1p' "${src}/details.txt" | cut -d'=' -f2`
  tag=`sed -n '2p' "${src}/details.txt" | cut -d'=' -f2`

  # build image
  echo "building: ${img}:${tag}"
  devcontainer build \
  --workspace-folder ${src} \
  --image-name ${img}:${tag} \
  --push false
  docker push ${img}:${tag}

  # if tag is x.y.z, tag as x.y
  if [[ "${tag}" == *.*.* ]]; then
    echo "tagging: ${img}:${tag%.*}"
    docker tag ${img}:${tag} ${img}:${tag%.*}
    docker push ${img}:${tag%.*}
  fi
done
