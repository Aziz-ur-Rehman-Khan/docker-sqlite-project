FROM ruby:2.7.2-alpine

RUN apk add --update ruby-dev\
 build-base\
  nodejs\
   tzdata\
    yaml-dev\
     sqlite-dev

RUN mkdir -p /dockerails

COPY . /dockerails
COPY ./Gemfile dockerails/Gemfile
COPY ./Gemfile.lock dockerails/Gemfile.lock
COPY ./entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /dockerails
RUN chmod +x /usr/bin/entrypoint.sh

RUN gem install bundler
RUN bundle install

EXPOSE 3000
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
