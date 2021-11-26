FROM ruby:3.0.2

# install modules
RUN apt-get update -qq && \
    apt-get install -y build-essential && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y imagemagick

RUN mkdir /imagemagick-worker
WORKDIR /imagemagick-worker
COPY Gemfile /imagemagick-worker/Gemfile
COPY Gemfile /imagemagick-worker/Gemfile.lock
RUN gem install bundle && \
    bundle install
COPY . /imagemagick-worker/

COPY ./entrypoint-dev.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

CMD ["entrypoint.sh"]
