FROM centos:latest
LABEL maintainer="ahsfar21@gmail.com"

# Install required packages
RUN yum install -y httpd zip unzip

# Download and extract the website files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

# Configure the HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 8 22
