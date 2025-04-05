# Real-time Monitoring System with AI Forecasting and Alerts

## Overview

This project automates the monitoring of system resources (CPU, memory, etc.) using Prometheus, Grafana, and Alertmanager. It makes use of AI forecasting to predict future CPU usage and alert when usage is expected to exceed 80%.

## Use-Cases

1. Real-time monitoring of server metrics.
   
2. AI-based forecasting to predict resource usage.

3. Proactive alerting through Discord when resource thresholds are exceeded.

## Files in this Repository

1. **`main.tf`** - Terraform configuration to provision an EC2 instance.

2. **`install.sh`** - Installation script for Prometheus, Grafana, Node Exporter, and Alertmanager.

3. **`config.sh`** - Configures systemd services to manage the monitoring tools.

4. **`ai_predict.py`** - AI script that predicts future CPU usage and sends alerts.

5. **`alert.rules.yml`** - Alert rules for Alertmanager.

6. **`alertmanager.yml`** - Configuration for Alertmanager to send alerts to Discord.

## Steps to Run

1. Set up the infrastructure using Terraform:
   
   - `terraform init`
     
   - `terraform apply`
     
2. Run the `install.sh` to install Prometheus, Grafana, Node Exporter, and Alertmanager.
   
3. Configure systemd services with `config.sh`.
  
4. Start the services using `start.sh`.
  
5. The `ai_predict.py` script will send alerts when CPU usage is predicted to exceed 80%.

## Notes

- Replace the Discord webhook URL in the relevant files.

- Screenshots of Prometheus, Grafana, and Discord alerts should be attached in your documentation (Medium, Hashnode, etc.)
