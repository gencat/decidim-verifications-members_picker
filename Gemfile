# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

gemspec

DECIDIM_VERSION = { github: "CodiTramuntana/decidim", branch: "release/0.29-stable", require: true }.freeze

group :development, :test do
  gem "bootsnap", require: true
  gem "byebug"
  gem "decidim", DECIDIM_VERSION
  gem "decidim-dev", DECIDIM_VERSION
  # Set versions because Property AutoCorrect errors.
  gem "rspec-rails", "~> 6.0.4"
  gem "rubocop-factory_bot", "~> 2.26"
  gem "rubocop-rspec", "~> 3.0"
end

group :development do
  gem "faker"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console"
end
