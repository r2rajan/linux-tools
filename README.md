# linux-tools
Linux Tools

This image provides all-in-one Ubuntu Management node with built-in tools and utilities commonly used by Linux 
Administrators. Following tools are covered in this container

<b>Build</b>
<p>docker build -t linux-tools:latest r2rajan/linux-tools/.  </p>

<b>Usage</b>

<p># NMAP to query a web server on port 443 for SSL ciphers </p>

docker exec mystifying_bardeen nmap -sV --script /opt/linux-tools/nmap/ssl-enum-ciphers <Destination Host> -p443 
	
NMAP - Nmap ("Network Mapper") is a free and open source utility for network discovery and security auditing. Many systems and network administrators also find it useful for tasks such as network inventory, managing service upgrade schedules, and monitoring host or service uptime. The container includes SSL Cipher enumeration script that readily initiates SSLv3/TLS connections, each time trying a new cipher or compressor while recording whether a host accepts or rejects it. The end result is a list of all the ciphersuites and compressors that a server accepts. This tool is very useful to identify weak ciphers supported by a server.
# 