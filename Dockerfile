FROM ruby:2.6.6
ENV BUNDLER_VERSION=2.1.4
RUN gem install bundler -v 2.1.4

RUN apt-get update -qq && apt-get install -y sqlite3 libsqlite3-dev
RUN mkdir /PhotoSiteApp
WORKDIR /PhotoSiteApp
COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install
COPY package.json yarn.lock ./
COPY . /PhotoSiteApp

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
