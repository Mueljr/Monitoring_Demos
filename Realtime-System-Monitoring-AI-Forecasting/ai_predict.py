import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
import psutil
import time
import requests
import matplotlib.pyplot as plt  # Importing the required plotting module
from datetime import datetime, timedelta

# Simulate system metrics (You would replace this with real-time system data)
# For the demonstration, we will assume these values as the last 10 minutes of CPU usage data
data = {'Time': np.arange(1, 11), 'CPU_Usage': [45, 47, 50, 55, 58, 60, 65, 70, 75, 80]}
df = pd.DataFrame(data)

# Train AI Model
X = df[['Time']]  # Features with column names
y = df['CPU_Usage']
model = LinearRegression().fit(X, y)

# Get current time and predict the next 5-minute forecast (real-time)
current_time = len(df) + 1  # Assuming this is the next time point
future_times = np.arange(current_time, current_time + 5).reshape(-1, 1)  # Predict next 5 time points (5 minutes from now)
predicted_usage = model.predict(future_times)

# Check if the predicted usage exceeds 80% and send an alert if so
if predicted_usage[-1] > 80:  # Check if the last predicted value exceeds 80%
    message = f"ALERT! Predicted CPU usage at time {future_times[-1][0]} is expected to exceed 80%. It is predicted to be {predicted_usage[-1]:.2f}%."
    print(message)  # This is for debugging
    # Replace with your actual Discord webhook URL
    webhook_url = 'https://discord.com/api/webhooks/YOUR_WEBHOOK_URL'
    data = {"content": message}
    requests.post(webhook_url, json=data)

# Optionally plot the results
plt.plot(df['Time'], df['CPU_Usage'], label="Actual CPU Usage")
plt.plot(future_times, predicted_usage, linestyle="dashed", label="Predicted CPU Usage")
plt.legend()
plt.show()