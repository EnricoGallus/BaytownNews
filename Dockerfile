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

# Entrypoint command will be set in the Docker Compose file
