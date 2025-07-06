FROM ruby:3.2.2
RUN apt-get update
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs postgresql-client
RUN npm install --global yarn

WORKDIR /myapp

COPY Gemfile Gemfile.lock /myapp/
RUN bundle install