# frozen_string_literal: true

require "rails"
require "decidim/core"
require "decidim/verifications"

module Decidim
  module Verifications
    module MembersPicker
      # This is the engine that runs on the public interface of decidim-verifications-members_picker.
      class Engine < ::Rails::Engine
        isolate_namespace Decidim::Verifications::MembersPicker

        config.to_prepare do
          Dir.glob(Decidim::Verifications::MembersPicker::Engine.root + "app/decorators/**/*_decorator*.rb").each do |c|
            require_dependency(c)
          end
        end
      end
    end
  end
end
