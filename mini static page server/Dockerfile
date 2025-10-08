FROM busybox:latest
# Create a non-root user to own the files and run our server
RUN adduser -D static

EXPOSE 80

# Use our non-root user
USER static
WORKDIR /home/static

# Uploads a blank default httpd.conf
# This is only needed in order to set the `-c` argument in this base file
# and save the developer the need to override the CMD line in case they ever
# want to use a httpd.conf
COPY httpd.conf .

# Copy the static website
# Use the .dockerignore file to control what ends up inside the image!
# NOTE: Commented out since this will also copy the .config file
COPY ./html/* .

# Run busybox httpd
CMD ["busybox", "httpd", "-f", "-v", "-p", "80", "-c", "httpd.conf"]
