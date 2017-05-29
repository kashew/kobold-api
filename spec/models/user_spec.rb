require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'from_token_payload' do
    let(:existing_user_google_id) { FFaker::DizzleIpsum.word }
    let!(:existing_user) { create(:user, google_id: existing_user_google_id) }
    let(:existing_user_payload) { { 'sub' => existing_user_google_id } }

    context 'when user does not exist' do
      it 'creates and returns user' do
        new_user_google_id = FFaker::DizzleIpsum.word
        new_user_payload = { 'sub' => new_user_google_id }
        user = User.from_token_payload(new_user_payload)

        expect(user).to be
        expect(user.google_id).to eq(new_user_google_id)
        expect(User.count).to eq(2)
      end
    end

    context 'when user does exist' do
      it 'finds and returns user' do
        user = User.from_token_payload(existing_user_payload)

        expect(user).to be
        expect(user.google_id).to eq(existing_user_google_id)
        expect(User.count).to eq(1)
      end
    end
  end
end
