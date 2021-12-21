FROM debian:10

# updates
RUN apt -y update
RUN apt -y upgrade

# ruby and development tools
RUN apt -y install ruby
RUN gem install bundle

# user
RUN adduser --disabled-password --home=/app --gecos "" app

RUN apt -y install git

ADD . /app
RUN chown -R app:app /app
RUN su - app -c 'bundle install --path=vendor/bundle'

# engage!
ADD .dockerfiles/run.sh /
CMD ["/run.sh"]
