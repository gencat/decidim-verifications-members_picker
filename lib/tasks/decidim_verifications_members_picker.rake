# frozen_string_literal: true

namespace :decidim_verifications do
  namespace :members_picker do
    desc "Grant MembersPicker Athorization for all Participants"
    task grant_authorization: :environment do
      log = ActiveSupport::Logger.new(Rails.root.join("log", "decidim_verifications_members_picker.log"))
      handler_name = Decidim::Verifications::MembersPicker::MembersPickerAuthorizationHandler.handler_name
      Decidim::Organization.find_each do |organization|
        if organization.available_authorizations.member?(handler_name)
          Decidim::User.find_each do |user|
            authorized = user.grant_authorization

            status, mark = if authorized then ["Authorized", "✔"]
                           else
                             ["Unauthorized", "✘"]
                           end

            msg = "#{mark} [#{handler_name}] #{status} User! [#{user.id}]"
            puts msg
            log.info msg
          end
        end
      end
    end
  end
end
