#!/usr/bin/env bash
set -ex

if [ "$FORCE_BUILD" == "on" ]; then
	echo "Forcing build of bitsandbytes ${BITSANDBYTES_VERSION}"
	exit 1
fi

# if it fails to install the specified version, try the dev version (like 0.45.4.dev0)
# which these wheels frequently get tagged as, but pip won't install as it evaluates as < than.
pip3 install --force-reinstall --no-cache-dir --verbose scipy bitsandbytes==${BITSANDBYTES_VERSION} || \
pip3 install --force-reinstall --no-cache-dir --verbose scipy bitsandbytes==${BITSANDBYTES_VERSION}.dev0