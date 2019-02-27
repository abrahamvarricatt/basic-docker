# Ubuntu LTS release
FROM ubuntu:18.04

# Update and install python 2.7
RUN apt-get update \
    && apt-get install -y python python-pip

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
# CMD ["tail", "-f", "app.py"]
