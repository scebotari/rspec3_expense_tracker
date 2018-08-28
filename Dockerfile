FROM ruby:2.4
EXPOSE 9292
VOLUME /expense_tracker

RUN useradd -ms /bin/bash scebotari

RUN mkdir -p /expense_tracker
COPY ./app /expense_tracker
WORKDIR /expense_tracker

RUN gem install bundler --no-ri --no-rdoc
RUN gem update

RUN bundle install
CMD [ "bundle exec rackup" ]
