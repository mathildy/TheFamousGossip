require 'test_helper'

class TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get presentation" do
    get team_presentation_url
    assert_response :success
  end

end
