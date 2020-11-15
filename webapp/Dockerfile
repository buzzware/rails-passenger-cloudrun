FROM phusion/passenger-ruby25

# Set correct environment variables.
ENV HOME /root
#ENV RAILS_ENV production


# Additional packages: we are adding the netcat package so we can
# make pings to the database service
RUN apt-get update && apt-get install -y -o Dpkg::Options::="--force-confold" netcat \
    build-essential \
    nodejs \
    libpq-dev \
    nano \
    wget \
    gettext-base

RUN echo 'after apt-get'

# Enable Nginx and Passenger
RUN rm -f /etc/service/nginx/down

# Add virtual host entry for the application. Make sure
# the file is in the correct path
RUN rm /etc/nginx/sites-enabled/default

# In case we need some environmental variables in Nginx. Make sure
# the file is in the correct path
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

# Install gems: it's better to build an independent layer for the gems
# so they are cached during builds unless Gemfile changes
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

RUN echo 'after bundle install'


# Copy application into the container and use right permissions: passenger
# uses the app user for running the application
RUN mkdir /home/app/webapp
COPY . /home/app/webapp
RUN usermod -u 1000 app
RUN chown -R app:app /home/app/webapp
WORKDIR /home/app/webapp


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE $PORT

COPY 25_docker_start.sh /etc/my_init.d/25_docker_start.sh
RUN chmod +x /etc/my_init.d/25_docker_start.sh
RUN rm -f /etc/my_init.d/10_syslog-ng.init

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]
