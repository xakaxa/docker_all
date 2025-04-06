#!/bin/bash

# Script to completely remove Docker from CentOS 7.9
# Run as root or use sudo

# Stop Docker services
echo "Stopping Docker services..."
systemctl stop docker docker.socket containerd
systemctl disable docker docker.socket containerd

# Remove containers, images, volumes, and networks
echo "Remove containers, images, volumes, and networks..."
[ -x "$(command -v docker)" ] && {
docker rm -f $(docker ps -aq) 2>/dev/null
docker rmi -f $(docker images -aq) 2>/dev/null
docker volume rm -f $(docker volume ls -q) 2>/dev/null
docker network rm $(docker network ls -q) 2>/dev/null
}

# Uninstall Docker packages
echo "Uninstalling Docker packages..."
yum remove -y docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-engine \
containerd.io \
docker-ce \
docker-ce-cli \
docker-compose-plugin \
docker-buildx-plugin

# Remove Docker files and directories
echo "Remove Docker files and directories..."
rm -rf /var/lib/docker
rm -rf /var/lib/containerd
rm -rf /etc/docker
rm -rf /var/run/docker
rm -rf /var/run/docker.sock
rm -rf /var/run/containerd
rm -rf /etc/systemd/system/docker.service.d
rm -rf /usr/local/bin/docker-compose
rm -rf /usr/local/bin/docker-buildx
rm -rf ~/.docker

# Cleanup Docker groups (if any)
echo "Cleaning Docker group..."
groupdel docker 2>/dev/null

# Reload systemd and list drives
echo "Reload systemd..."
systemctl daemon-reload
systemctl reset-failed

# Clean unused packages and dependencies
echo "Cleaning unused packages and dependencies..."
yum autoremove -y
yum clean all

# Verify complete removal
echo "Verifying complete removal..."
if [ -x "$(command -v docker)" ]; then
echo "WARNING: Docker appears to still be installed!"
else
echo "Docker has been successfully removed from the system."
fi

echo "The Docker removal process has completed."
