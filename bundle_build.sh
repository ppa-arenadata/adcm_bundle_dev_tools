#!/bin/bash

src="$PWD"
target_dir="${src}/../build_bundles"
move_to_old_target="${src}/../old_build_bundles"

date="$(date '+%Y.%m.%d_%T')"

SCRIPTPATH="$(dirname "$0")"


if [ ! -d "$move_to_old_target" ]
then
  mkdir "$move_to_old_target"
fi

if [ -d "$target_dir" ]
then
  mkdir "$move_to_old_target/$date"	
  mv "$target_dir"/* "$move_to_old_target/$date"
else
  mkdir "$target_dir"
fi

source "${SCRIPTPATH}/venv/bin/activate"
adcm_sdk_pack -n ppa-adb -p $src -t "$target_dir"
if [ "$?" -eq "0" ]
then
  echo "bundle build succesfull"
else
  echo "bundle build failed!"
fi
