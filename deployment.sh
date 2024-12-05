#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )


virtualenv venv --python=python3.10

source venv/bin/activate


pip install -r requirements.txt

# Test Locally
#sls wsgi serve

# Redeploy severless function
sls deploy