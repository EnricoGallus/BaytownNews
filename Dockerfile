FROM ruby:3.2.1

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -\
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    poppler-utils \
    ffmpeg \
    libgirepository1.0-dev \
    libpoppler-glib-dev \
    libvips42 \
  && apt-get upgrade -qq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*\
  && npm install -g yarn@1

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Bundlerの不具合対策(1)
RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
