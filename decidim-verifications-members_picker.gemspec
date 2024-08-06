# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/verifications/members_picker/version"

DECIDIM_VERSION = ">= 0.27.5"

Gem::Specification.new do |s|
  s.version = Decidim::Verifications::MembersPicker.version
  s.authors = ["Agusti B.R."]
  s.email = ["agusti.br@coditramuntana.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/gencat/decidim-verifications-members_picker"
  s.required_ruby_version = ">= 3.0"

  s.name = "decidim-verifications-members_picker"
  s.summary = "A decidim-verifications module to restrict which emails can participate in components."
  s.description = "The Admin is able to hand-pick which emails are allowed to participate from the component permissions screen."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", DECIDIM_VERSION
  s.add_dependency "decidim-verifications", DECIDIM_VERSION
  s.add_dependency "psych", "< 4"

  s.add_development_dependency "decidim", DECIDIM_VERSION
  s.add_development_dependency "decidim-dev", DECIDIM_VERSION
end
