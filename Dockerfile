# Use the official Apache Spark Docker image as the base image
FROM apache/spark-py:v3.3.2

# Set the working directory
WORKDIR /app

# Copy the Python script and other files to the container
COPY . /app

# Install any additional dependencies
RUN pip install --user -r requirements.txt


# Start application
CMD ["spark-submit", "main.py", "ValidationDataset.csv", "winemodel"]
