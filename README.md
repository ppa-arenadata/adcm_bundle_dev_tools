install.sh - create VENV for adcm-client

bundle-build.sh - build bundles from current dir. Output to ../build_bundles. Old builds move to old_build_bundles

rsync_bundle_to_adcm - extract bundle and rsync to adcm bundle dir
run as: rsync_bundle_to_adcm EDITION USER@ADCM_HOST:/path_to_adcm_volume/data/bundle/HASH
