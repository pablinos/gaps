FROM phusion/passenger-ruby21
MAINTAINER Paul Bunkham <paul@dobit.co.uk>
ADD . /gaps
# If you're running a version of docker before .dockerignore
RUN rm -f /gaps/site.yaml*
RUN chown -R app: /gaps
USER app
ENV HOME /home/app
RUN cd /gaps && bundle install --path vendor/bundle
WORKDIR /gaps
EXPOSE 3500
CMD ["bin/gaps_server.rb"]
