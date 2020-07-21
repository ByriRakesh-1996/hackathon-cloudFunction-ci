#!/bin/bash

echo "Read env properties"
set -o allexport
source local.env
set +o allexport

echo "IBM Cloud login"
echo "${IBM_CLOUD_API_KEY}"
echo "ibmcloud login -a https://cloud.ibm.com --apikey ${IBM_CLOUD_API_KEY} -r us-south"
ibmcloud login -a https://cloud.ibm.com --apikey ${IBM_CLOUD_API_KEY} -r us-south

ibmcloud target -g CDT_Provider_ENGMNT_Cluster_01_RG -cf

ibmcloud plugin list

#chmod 755 *.*

echo "Starting test-workload ..."
pwd
ls -ltr

echo "Deploy Artifacts"
bash deploy.sh
