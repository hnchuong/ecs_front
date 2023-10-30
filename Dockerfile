FROM ruby:2.7.1

LABEL Name=ecsfront Version=0.0.1

# EXPOSE 4000

RUN apt-get update && apt-get install -y nodejs yarn
RUN bundle config --global frozen 1

RUN mkdir /app
WORKDIR /app

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
# RUN gem install bundler
RUN bundle install

COPY . /app
