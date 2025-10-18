# Use Rocky Linux as the base image
FROM rockylinux:9

# Install Apache (httpd)
RUN dnf -y update && \
    dnf -y install httpd && \
    dnf clean all

# Copy custom web content (optional)
COPY ./index.html /var/www/html/index.html

# Expose HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
