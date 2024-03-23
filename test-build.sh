#!/bin/bash
##
# Script to test that the module build works, by sending it to the build service
# to run the build through BBC BASIC.
#
# Syntax: test-build.sh
#

set -eo pipefail

# Fetch the build client
echo Obtain build client
if [ "$(uname -s)" != 'Darwin' ] ; then
    RISCOS_BUILD_ONLINE=./riscos-build-online
    curl -s -L -o riscos-build-online https://github.com/gerph/robuild-client/releases/download/v0.05/riscos-build-online && chmod +x riscos-build-online
else
    # On other macOS, assume you've built it in your path
    RISCOS_BUILD_ONLINE=riscos-build-online
fi

# Zip up the test code to send to the build service
echo Zip up the source to send
rm -f /tmp/source-archive.zip
zip -q9r /tmp/source-archive.zip ARM6Src,fd1 .robuild.yaml

# Send the archive file to build service
echo Run on the build service
"${RISCOS_BUILD_ONLINE}" -i /tmp/source-archive.zip -a off -t 60 -o ARM6Supp
