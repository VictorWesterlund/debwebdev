#!/bin/bash

source ./func.sh

label "⧖ Installing Google Cloud SDK.."

# Google Cloud SDK
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` > /dev/null 2>&1
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" > /dev/null 2>&1 | sudo tee /etc/apt/sources.list.d/gcsfuse.list > /dev/null 2>&1
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" > /dev/null 2>&1 | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list > /dev/null 2>&1
update
install "apt-transport-https" "apt-transport-https"
install "ca-certificates" "ca-certificates"
install "gnupg" "gnupg"
install "curl" "curl"
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg > /dev/null 2>&1 | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - > /dev/null 2>&1
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg > /dev/null 2>&1 | sudo apt-key add - > /dev/null 2>&1
update
install "Google Cloud SDK" "google-cloud-sdk"
install "Google Cloud Storage FUSE" "gcsfuse"

overwrite "✓ Google Cloud SDK installed."