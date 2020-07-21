#!/bin/bash

echo "in pre docker build"

echo "Pull Artifacts from JFrog artifactory"
bash pullArtifacts.sh

ls -ltr
ls -ltr workload-scripts/

echo "Update env file with env variables"
cd workload-scripts
set -xe
sed "s/{IBM_CLOUD_API_KEY}/${IBM_CLOUD_API_KEY}/" local.env > local.tmp
#diff local.env local.tmp
cp local.tmp local.env 
cd ..
