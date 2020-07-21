RELEASE_VERSION=0.0.1
echo "Downloading Jars From JFrog Artifactory"
JarFiles=( FibonacciCloudFunction NumberCountCloudFunction )
for file in "${JarFiles[@]}"
do
	echo $file
	echo "curl -u ${ARTIFACTORY_USER_NAME}:${ARTIFACTORY_API_KEY} -O ${JFROG_ARTIFACTORY}/${file}-${RELEASE_VERSION}.jar"
	curl -u ${ARTIFACTORY_USER_NAME}:${ARTIFACTORY_API_KEY} -O "${JFROG_ARTIFACTORY}/${file}-${RELEASE_VERSION}.jar"
	mv ${file}-${RELEASE_VERSION}.jar workload-scripts/
	if [[ $? -ne 0 ]]
	then
		echo $file "File not found"
	else
		echo $file "File downloaded"
	fi
done
