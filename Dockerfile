FROM ruby:2.6.5-slim-stretch

# Install essential Linux packages
RUN apt-get update
RUN apt-get install -y nodejs postgresql-client

# Make the directory
RUN mkdir /instapics

# Establish working directory (where the commands will be run)
WORKDIR /instapics

# Install bundler
RUN gem install bundler

# USe Gemfiles as Docker cache markers. Alway bundle before coppying the app soruce.
COPY Gemfile /instapics/Gemfile
COPY Gemfile.lock /instapics/Gemfile.lock

# Sets the Gems path
RUN bundle install

# Copy code base to container
COPY . .

#
CMD rake db:create db:migrate
