# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap
pin 'application', preload: true
pin '@popperjs/core', to: 'popper.js', preload: true
pin 'bootstrap', to: 'bootstrap.min.js', preload: true
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.js'
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
