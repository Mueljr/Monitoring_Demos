#!/bin/bash

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install required packages
echo "Installing dependencies..."
sudo apt install -y wget tar adduser libfontconfig1

# Install Musl (dependency for Grafana)
sudo apt-get update
sudo apt-get install -y musl

# Create Prometheus user
echo "Creating Prometheus user..."
sudo useradd --no-create-home --shell /bin/false prometheus

# Install Prometheus
echo "Downloading and installing Prometheus..."
wget https://github.com/prometheus/prometheus/releases/download/v2.51.2/prometheus-2.51.2.linux-amd64.tar.gz
tar -xvzf prometheus-2.51.2.linux-amd64.tar.gz
sudo mv prometheus-2.51.2.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-2.51.2.linux-amd64/promtool /usr/local/bin/

# Install Node Exporter
echo "Downloading and installing Node Exporter..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
tar -xvzf node_exporter-1.9.1.linux-amd64.tar.gz
sudo mv node_exporter-1.9.1.linux-amd64/node_exporter /usr/local/bin/

# Install Alertmanager
echo "Downloading and installing Alertmanager..."
wget https://github.com/prometheus/alertmanager/releases/download/v0.28.1/alertmanager-0.28.1.linux-amd64.tar.gz
tar -xvzf alertmanager-0.28.1.linux-amd64.tar.gz
sudo mv alertmanager-0.28.1.linux-amd64/alertmanager /usr/local/bin/

# Install Grafana
echo "Downloading and installing Grafana..."
wget https://dl.grafana.com/oss/release/grafana_10.3.1_amd64.deb
sudo dpkg -i grafana_10.3.1_amd64.deb

echo "Installation complete."