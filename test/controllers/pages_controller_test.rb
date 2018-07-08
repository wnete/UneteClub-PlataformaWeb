require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get land" do
    get pages_land_url
    assert_response :success
  end

end
