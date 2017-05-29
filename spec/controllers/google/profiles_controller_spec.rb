require 'rails_helper'

describe Google::ProfilesController, :type => :controller do
  let(:user_payload) { FFaker::DizzleIpsum.word }
  let(:user_id) { "current" }

  before do
    user = create(:user)

    knock = double(:Knock)
    allow(Knock::AuthToken).to receive(:new).and_return(knock)
    allow(knock).to receive(:entity_for).and_return(user_payload)
  end

  context 'when token is valid' do
    before do
      request.headers['authorization'] = 'Bearer JWTTOKEN'
    end

    it 'returns the user profile' do
      expect(User).to receive(:from_token_payload).with(user_payload)

      get :show, params: { id: user_id }

      expect(response).to be_success
      expect(response.body).to eq(user_payload)
    end
  end

  context 'when token is invalid' do
    it 'returns an error' do
      invalid_token = FFaker::DizzleIpsum.word

      get :show, params: { id: invalid_token }

      expect(response).not_to be_success
      expect(response.status).to eq(401)
    end
  end
end
