require 'test_helper'

class Google::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @google_profile = google_profiles(:one)
  end

  test "should show google_profile" do
    get google_profile_url(@google_profile), as: :json
    assert_response :success
  end
end
