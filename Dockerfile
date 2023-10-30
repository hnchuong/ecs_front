FROM ruby:2.7.1

LABEL Name=ecsfront Version=0.0.1

RUN mkdir /app
WORKDIR /app

# EXPOSE 4000

#RUN apt-get update && apt-get install -y nodejs yarn
#RUN bundle config --global frozen 1

RUN apt-get update && apt-get install -y curl gnupg2 && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

COPY package.json yarn.lock ./
RUN yarn install --check-files

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
# RUN gem install bundler
RUN bundle install

#COPY . /app
COPY . .
