require 'test_helper'

class BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get 'brands/new'
    assert_response :success
  end

end
