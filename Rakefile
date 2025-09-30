# frozen_string_literal: true

require "decidim/dev/common_rake"
load "lib/tasks/decidim_verifications_members_picker.rake"

# Workaround extracted from here: https://github.com/DiputacioBarcelona/decidim-diba/commit/17f154f7a37a262f7f3e75599e8f40e64aea15bb
def replace_cache_classes
  path = "spec/decidim_dummy_app/config/environments/test.rb"
  flag = /config\.cache_classes = true$/
  replacement = "config.cache_classes = false"

  content = File.binread(path)
  content.gsub!(flag, replacement)
  File.binwrite(path, content)
end

desc "Generates a dummy app for testing"
task test_app: "decidim:generate_external_test_app" do
  ENV["RAILS_ENV"] = "test"
  replace_cache_classes
end

desc "Generates a development app."
task development_app: "decidim:generate_external_development_app"
