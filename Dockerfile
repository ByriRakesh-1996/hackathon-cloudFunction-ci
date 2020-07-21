FROM ibmcom/ibm-cloud-developer-tools-amd64
#FROM maven:3.6-ibmjava-8-alpine

LABEL maintainer="Sai Sravani Chilamkurthy"
LABEL description="Communication engine"

# Install OS dependencies
RUN apk add curl
RUN apk add bash

# Upgrade vulnerabilities
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" >> /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/community" >> /etc/apk/repositories
RUN apk update
RUN apk upgrade libcrypto1.0 libssl1.0

# Install IBMCLOUD cli
#RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
#RUN ibmcloud update
#RUN ibmcloud -v

RUN echo "Install es and fn plugins"
RUN ibmcloud plugin install event-streams
#RUN ibmcloud plugin install cloud-functions
RUN ibmcloud plugin list

# Not Running the workload as root
# This is good security and also fixes this error:
#  Error: container has runAsNonRoot and image will run as root
# Create a group and user
#RUN addgroup -S workloadgroup && adduser -u 1042 -S workloaduser -G workloadgroup -h /home/workloaduser

# Tell docker that all future commands should run as the appuser user
#USER 1042

# Copy Workload Scripts to Image
WORKDIR /home/workloaduser
ADD ./workload-scripts ./
#RUN /bin/bash -c 'ls -la; chmod +x *.*; ls -la'

#adding a command so the image doesn't exit
CMD ["/bin/bash", "-c", "tail -f /dev/null"]
