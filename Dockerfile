# Use a minimal Python base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependency file and install packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your app code and scripts
COPY . .

# Make sure script is executable
RUN chmod +x my_script.sh

# Expose the port your app listens on
EXPOSE 8000

# Start Gunicorn to serve the app
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000", "--workers", "2"]
