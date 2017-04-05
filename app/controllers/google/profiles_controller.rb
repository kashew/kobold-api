class Google::ProfilesController < ApplicationController
  before_action :set_google_profile, only: [:show]

  # GET /google/profiles/1
  def show
    render json: @google_profile
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_google_profile
      @google_profile = Google::Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def google_profile_params
      params.fetch(:google_profile, {})
    end
end
