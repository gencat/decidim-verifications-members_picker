# frozen_string_literal: true

Decidim::Verifications.register_workflow(:members_picker_authorization_handler) do |workflow|
  workflow.form = "Decidim::Verifications::MembersPicker::MembersPickerAuthorizationHandler"
  workflow.action_authorizer = "Decidim::Verifications::MembersPicker::MembersPickerAuthorizationHandler::MembersPickerActionAuthorizer"

  workflow.options do |options|
    options.attribute :members_picker, type: :text, required: false
  end
end
