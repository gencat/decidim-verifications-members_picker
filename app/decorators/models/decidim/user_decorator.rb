# frozen_string_literal: true

Decidim::User.class_eval do
  def after_confirmation
    return unless available_members_picker_authorization?
    Decidim::Authorization.create_or_update_from(handler)
  end

  def grant_authorization
    after_confirmation
  end

  def email_changed?
    revoke_members_picker_authorization!
  end

  private

  def available_members_picker_authorization?
    organization.available_authorizations.member?(handler_name)
  end

  def handler_params
    @handler_params ||= { user: self, members_picker: email }
  end

  def handler_name
    @handler_name ||= Decidim::Verifications::MembersPicker::MembersPickerAuthorizationHandler.handler_name
  end

  def handler
    @handler ||= Decidim::AuthorizationHandler.handler_for(handler_name, handler_params)
  end

  def granted_members_picker_authorization
    @granted_members_picker_authorization ||= Decidim::Authorization.find_by(decidim_user_id: id, name: handler_name)
  end

  def revoke_members_picker_authorization!
    granted_members_picker_authorization.destroy! if granted_members_picker_authorization
  end
end
