#!/bin/bash

set -euxo pipefail

# Set up hyperspace storage directory
if [ ! -e /config/hyperspace ]; then
    mkdir /config/hyperspace
fi

ln -s /config/hyperspace $HOME/.hyperspace

# Create a drive if it hasn't been created yet
if [ ! -e /config/drive.id ]; then
    hyp create drive 2>&1 | sed -rne 's/Drive Created: (.*)/\1/ p' > /config/drive.id
fi

DRIVE_ID=$(cat /config/drive.id)
hyp drive sync --yes --watch /data/ $DRIVE_ID/



