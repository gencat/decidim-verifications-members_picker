# frozen_string_literal: true

module Decidim
  module Verifications
    module MembersPicker
      class MembersPickerAuthorizationHandler < Decidim::AuthorizationHandler
        attribute :members_picker, String

        validates :members_picker, presence: true

        validate :valid_members_picker

        def unique_id
          members_picker
        end

        def metadata
          super.merge(members_picker:)
        end

        private

        def valid_members_picker
          errors.add(:members_picker, :invalid) unless members_picker == user.email
        end

        class MembersPickerActionAuthorizer < Decidim::Verifications::DefaultActionAuthorizer
          attr_reader :allowed_members_picker

          def authorize
            @allowed_members_picker ||= options.delete("members_picker")

            status_code, data = *super
            if allowed_members_picker.present?
              if status_code == :ok && !allowed_members_picker.include?(authorization.metadata["members_picker"])
                status_code = :unauthorized
                data[:fields] = { "members_picker" => authorization.metadata["members_picker"] }
              end

              data[:extra_explanation] = { key: "extra_explanation",
                                           params: { scope: "decidim.verifications.members_picker_authorization" } }
            end

            [status_code, data]
          end
        end
      end
    end
  end
end
