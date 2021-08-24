#!/bin/bash

source ./func.sh

label "⧖ Installing Python3.."

install "Python3" "python3"
python3 -m pip install > /dev/null 2>&1

overwrite "✓ Python3 Installed."