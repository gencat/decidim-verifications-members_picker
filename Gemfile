# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gemspec

group :development, :test do
  gem "bootsnap", require: true
  gem "byebug"
  gem "social-share-button"
  # Set versions because Property AutoCorrect errors.
  gem "rspec-rails", "~> 6.0.4"
  gem "rubocop-factory_bot", "2.25.1"
  gem "rubocop-rspec", "2.26.1"
end

group :development do
  gem "faker"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console"
end
