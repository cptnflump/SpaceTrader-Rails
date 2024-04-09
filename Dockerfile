# Base image:
FROM ruby:3.3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set work directory
WORKDIR /spacetrader

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile /spacetrader/Gemfile
COPY Gemfile.lock /spacetrader/Gemfile.lock

# Install gems
RUN bundle install

# Copy the main application.
COPY . /spacetrader

# Expose the port the app runs on
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]

