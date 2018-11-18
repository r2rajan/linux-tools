#
# Dockerfile - Linux Tools
#
# - Build
# docker build -t linux-tools:latest r2rajan/linux-tools/. 
# 
# - Usage
# NMAP to query a web server on port 443 for SSL ciphers 
# 
# docker exec mystifying_bardeen nmap -sV --script /opt/linux-tools/nmap/ssl-enum-ciphers <Destination Host> -p443 

# 1. Base images
FROM     ubuntu:16.04
MAINTAINER Ramesh Rajan <rajan.ramesh@gmail.com>

# 2. Set the environment variable
#WORKDIR /opt
#ENV VERSION=2.6
#ENV RELEASE=0

# 3. Setup the basic system to have network, SSH server
# Root Password is set up with an easy password. Can be changed to secure strong password
RUN apt-get update 
RUN apt-get install -y network-manager net-tools dnsutils \
 && apt-get install -y ssh 

# 4. Root Password is set up with an easy password. Can be changed to secure strong password
RUN  echo 'root:password' | chpasswd \
 && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 5. Install Linux Tools 
# - Nmap - Network Mapping Tool
RUN apt-get install -y nmap 

# 6. Create a Volume to store the scripts
VOLUME /opt/linux-tools

# 7. Copy NMAP configuration Scripts
RUN mkdir /opt/linux-tools/nmap
COPY ssl-enum-ciphers.nse /opt/linux-tools/nmap/


# 8. Start SSH service
ENTRYPOINT service ssh start  \
 && echo 'THE IP ADDRESS of this container is' \
 && ip addr show eth0 | grep inet | awk '{print $2}' \
 && sleep &

# Port

EXPOSE 22
