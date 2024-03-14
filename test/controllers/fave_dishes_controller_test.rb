require "test_helper"

class FaveDishesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get fave_dishes_show_url
    assert_response :success
  end
end
