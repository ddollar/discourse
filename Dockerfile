FROM ruby:2.1.2

# create app root
RUN mkdir -p /app
WORKDIR /app

# install nodejs
RUN curl http://nodejs.org/dist/v0.10.31/node-v0.10.31-linux-x64.tar.gz | tar -xz -C /usr --strip-components 1

# bundler
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD vendor/gems /app/vendor/gems
RUN bundle install

# listener port
ENV PORT 3000
EXPOSE 3000

ADD . /app

CMD rails server
