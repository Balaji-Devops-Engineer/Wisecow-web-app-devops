# Set the base image
FROM ubuntu:22.04

# Set environment variables
ENV PATH=/usr/games:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#ENV LAUNCHPAD_BUILD_ARCH=<value> 

# Set the working directory
WORKDIR /app

# Copy the wisecow.sh file
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x wisecow.sh

# Install dependencies
RUN apt-get update && apt-get install -y cowsay fortune netcat

# Expose the port
EXPOSE 4499

# Set the default command
CMD ["./wisecow.sh"]
