# Use a lightweight official Python image
FROM python:3.11-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your app files into the container
COPY . .

# Expose the port Flask/Gunicorn will listen on
EXPOSE 8000

# Run Gunicorn to serve your app
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000", "--workers", "2"]
