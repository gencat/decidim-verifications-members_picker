# frozen_string_literal: true

require "spec_helper"
require "decidim/dev/test/authorization_shared_examples"

module Decidim
  describe Verifications::MembersPicker::MembersPickerAuthorizationHandler do
    let(:handler) { described_class.new(params.merge(extra_params)) }
    let(:user) { create(:user, :confirmed) }
    let(:params) { { user: user } }
    let(:email) { user.email }
    let(:extra_params) { {} }

    it_behaves_like "an authorization handler"

    describe "metadata" do
      subject { handler.metadata }

      let(:extra_params) { { members_picker: email } }

      it { is_expected.to eq(members_picker: email) }
    end

    describe "valid?" do
      subject { handler.valid? }

      let(:extra_params) { { members_picker: email } }

      context "when no email" do
        let(:email) { nil }

        it { is_expected.to eq(false) }
      end

      context "when email is not allowed" do
        let(:email) { "invalid@example.org" }

        it { is_expected.to eq(false) }
      end

      context "when email is allowed" do
        # let(:email) { "123456X" }

        it { is_expected.to eq(true) }
      end
    end
  end
end
