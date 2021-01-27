#!/bin/bash

edition="$1"

src="$PWD"
target_dir="${src}/../build_bundles"

date="$(date '+%Y.%m.%d_%T')"

tmp_dir="${src}/../tmp_upload_to_adcm/$date"

path_adcm_bundle="$2"


if [ -v $edition ] || ( [ "$edition" != "community" ] && [ "$edition" != "enterprise" ] )
then
  echo "first param must be EDITION"
  exit 1
fi

if [ -v $path_adcm_bundle ]
then
  echo "second param must be PATH_ADCM_BUNDLE. Example:"
  echo "10.92.6.77:/opt/adcm-dev/bundle/5756375d3f0a8e070106a71925ec56cfa0ffb03d/"
  exit 1
fi


mkdir -p "$tmp_dir"

pushd "$tmp_dir" > /dev/null

tarfile=$(find "$target_dir" -name "*${edition}\.tgz")

tar -xvf "$tarfile"

rsync --rsync-path="sudo rsync" -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" -a --del -v --progress . "$path_adcm_bundle"

popd > /dev/null

rm -rf "${src}/../tmp_upload_to_adcm"