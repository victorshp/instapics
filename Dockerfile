FROM ruby 2.6.6

# Install essential Linux packages
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
build-essential \
npm \
libpq-dev \
nodejs \
postgresql-client \

# Set path
ENV RAILS_ROOT /instapics

# Make the directory
RUN mkdir -p $RAILS_ROOT

# Establish working directory (where the commands will be run)
WORKDIR $RAILS_ROOT

# Install bundler
RUN gem install bundler

# USe Gemfiles as Docker cache markers. Alway bundle before coppying the app soruce.
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# Sets the Gems path
RUN bundle install

# Copy code base to container
COPY . .

#
CMD rake db:create db:migrate
