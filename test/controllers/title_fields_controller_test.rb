require 'test_helper'

class TitleFieldsControllerTest < ActionController::TestCase
  test "should get output" do
    get :output
    assert_response :success
  end

end
