FROM ruby:latest

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -\
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    postgresql-client \
    poppler-utils \
    ffmpeg \
    libgirepository1.0-dev \
    libpoppler-glib-dev \
    libvips42 \
  && apt-get upgrade -qq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*\
  && npm install -g yarn@1

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler
RUN bundle install

COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
