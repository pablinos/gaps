FROM phusion/passenger-ruby21
MAINTAINER Paul Bunkham <paul@dobit.co.uk>
ENV PORT 3500
EXPOSE 3500
ADD . /gaps
ADD Gemfile* /gaps/
RUN cd /gaps && bundle install --path vendor/bundle
# If you're running a version of docker before .dockerignore
RUN rm -f /gaps/site.yaml*
RUN chown -R app: /gaps
USER app
ENV HOME /home/app
ENV RACK_ENV production
WORKDIR /gaps
CMD ["bin/gaps_server.rb"]
