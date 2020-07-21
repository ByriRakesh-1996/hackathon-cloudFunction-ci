#!/bin/bash

cat manifest.yaml
echo "***************************************"
echo "Deploying Cloud function artifacts"
ibmcloud fn deploy --manifest manifest.yaml
if [ $? -ne 0 ]
then
 ibmcloud fn undeploy ......
 echo "undeployed ....."
fi
