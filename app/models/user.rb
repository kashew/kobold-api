class User < ApplicationRecord
  def self.from_token_payload(payload)
    find_or_create_by(
      google_id: payload['sub']
    )

    payload
  end
end
