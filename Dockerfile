# Ubuntu LTS release
FROM ubuntu:18.04

# Set the working directory to /usr/src/app
WORKDIR /usr/src/app

# Update and install 
# python 2.7, pip -> for the application
# uwsgi -> to act as application server
# libpcre3 -> get rid of warning in uwsgi logs
RUN apt-get update \
    && apt-get install -y python python-pip \
    && apt-get install -y libpcre3 libpcre3-dev \
    && pip install uwsgi

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
# CMD ["python", "app.py"]
CMD ["uwsgi", "--ini", "uwsgi.ini"]
