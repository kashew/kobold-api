class Google::ProfilesController < ApplicationController
  before_action :authenticate_user, only: [:show]

  # GET /google/profiles/1
  def show
    User.from_token_payload(current_user)

    render json: current_user
  end
end
