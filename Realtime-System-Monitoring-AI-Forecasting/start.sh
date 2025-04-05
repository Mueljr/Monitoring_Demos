#!/bin/bash

echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Enabling and starting services..."
sudo systemctl enable --now prometheus
sudo systemctl enable --now node_exporter
sudo systemctl enable --now alertmanager
sudo systemctl enable --now grafana-server

echo "Checking service statuses..."
sudo systemctl status prometheus --no-pager
sudo systemctl status node_exporter --no-pager
sudo systemctl status alertmanager --no-pager
sudo systemctl status grafana-server --no-pager

echo "All services started successfully!"