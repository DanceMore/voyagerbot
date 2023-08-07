FROM debian:bookworm-slim
MAINTAINER rk <dancemore@dancemore.xyz>

# apt updates
RUN apt -y update
RUN apt -y upgrade

# ruby and development tools
RUN apt -y install ruby bundler git

# user account
RUN adduser --disabled-password --home=/app --gecos "" app

# add the code
ADD . /app
RUN chown -R app:app /app

# build it
RUN su - app -c 'bundle install --path=vendor/bundle'

# engage!
ADD .dockerfiles/run.sh /
CMD ["/run.sh"]
