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
end

group :development do
  gem "faker"
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "web-console"
end
