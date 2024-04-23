# Base image - Ubuntu
FROM ubuntu:latest

# Update packages and install required dependencies
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    python3 \
    python3-pip \
    wget \
    && rm -rf /var/lib/apt/lists/*



# Set up working directory
WORKDIR /app

# Copy the Python script and requirements file
COPY . /app/


# Install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt
RUN chmod 774 *

# Start application
CMD ["spark-submit", "main.py", "ValidationDataset.csv", "winemodel"]
